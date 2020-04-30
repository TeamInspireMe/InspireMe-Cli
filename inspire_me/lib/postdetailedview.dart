import 'package:flutter/material.dart';
import 'package:inspire_me/postview.dart';
import './postclass.dart';

class PostDetailedView extends StatefulWidget {
  final Post post;
  PostDetailedView(this.post);
  @override
  _PostDetailedViewState createState() => _PostDetailedViewState();
}

class _PostDetailedViewState extends State<PostDetailedView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        centerTitle: true,
        title: Text(
          "Post by user",
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
            children: widget.post.comments.map((comment) => Commentary(comment)).toList(),
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
                    child: TextField(
                      decoration: InputDecoration(
                          fillColor: Colors.grey[200],
                          filled: true,
                          contentPadding: EdgeInsets.symmetric(horizontal: 5),
                          border: InputBorder.none,
                          hintText: 'Write comment ...'),
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
    return Card(
        margin: EdgeInsets.symmetric(vertical: 1.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Row(
                  children: <Widget>[
                    Text('${widget.comment.user}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                    SizedBox(width: 5),
                    Text(
                      '${widget.comment.hour}h ago',
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
