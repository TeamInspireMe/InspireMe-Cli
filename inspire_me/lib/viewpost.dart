import 'package:flutter/material.dart';
import 'package:inspire_me/post.dart';
import './commentary.dart';

class ViewPost extends StatefulWidget {
  @override
  _ViewPostState createState() => _ViewPostState();
}

class _ViewPostState extends State<ViewPost> {
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
          Post(true),
          Expanded(
              child: ListView(children: [
            CommentView(),
            CommentView(),
            CommentView(),
            CommentView()
          ])),
        ],
      )),
      bottomNavigationBar: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: BottomAppBar(
            child: Container(
                height: 50.0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:8.0),
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
