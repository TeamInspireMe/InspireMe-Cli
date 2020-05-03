import 'package:flutter/material.dart';
import './postview.dart';
import '../class/postclass.dart';
import '../class/user.dart';

class PostDetailedView extends StatefulWidget {
  final Post post;
  PostDetailedView(this.post);
  @override
  _PostDetailedViewState createState() => _PostDetailedViewState();
}

class _PostDetailedViewState extends State<PostDetailedView> {
  final controller = TextEditingController();
  bool postable = false;

  addComment(comment) {
    widget.post.comments.add(Comment(
        User(3,'email', 'Steeve', 'password', DateTime(2020, 05, 01, 13, 00),
            'profilPic'),
        comment,
        DateTime.now()));
    FocusScope.of(context).unfocus();
    controller.text = '';
    setState(() {
      postable = false;
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        centerTitle: true,
        title: Text(
          "Post by ${widget.post.user.username}",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.more_vert),
            //tooltip: 'Next page',
            onPressed: () {},
            color: Colors.black,
          )
        ],
      ),
      body: Container(
          child: Column(
        children: [
          PostView(
            true,
            widget.post,
          ),
          Expanded(
              child: ListView(
            children: widget.post.comments
                .map((comment) => Commentary(comment))
                .toList(),
          )),
        ],
      )),
      bottomNavigationBar: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: BottomAppBar(
            child: Container(
                height: 50.0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Card(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            onChanged: (text) {
                              if (controller.text.length > 0) {
                                setState(() {
                                  postable = true;
                                });
                              } else if (controller.text.length == 0) {
                                setState(() {
                                  postable = false;
                                });
                              }
                            },
                            controller: controller,
                            decoration: InputDecoration(
                                fillColor: Colors.grey[200],
                                filled: true,
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 5),
                                border: InputBorder.none,
                                hintText: 'Write comment ...'),
                          ),
                        ),
                        if (postable)
                          IconButton(
                            icon: const Icon(Icons.send),
                            //tooltip: 'Next page',
                            onPressed: () {
                              addComment(controller.text);
                            },
                            color: Colors.orange,
                          ),
                      ],
                    ),
                  ),
                ))),
      ),
    );
  }
}

class Commentary extends StatefulWidget {
  final Comment comment;
  Commentary(this.comment);
  @override
  _CommentaryState createState() => _CommentaryState();
}

class _CommentaryState extends State<Commentary> {
  @override
  Widget build(BuildContext context) {
    int difference = DateTime.now().difference(widget.comment.createdAt).inHours;

    return Card(
        margin: EdgeInsets.symmetric(vertical: 1.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Row(
                  children: <Widget>[
                    Text('${widget.comment.user.username}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                    SizedBox(width: 5),
                    Text(
                      '${difference}h ago',
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.more_vert),
                  //tooltip: 'Next page',
                  onPressed: () {},
                  color: Colors.black,
                )
              ]),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 15.0),
                child: Center(
                    child: Text(
                  '${widget.comment.text}',
                  style: TextStyle(fontSize: 20.0),
                )),
              )
            ],
          ),
        ));
  }
}
