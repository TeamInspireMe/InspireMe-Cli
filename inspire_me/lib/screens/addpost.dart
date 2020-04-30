import 'package:flutter/material.dart';

class AddPost extends StatefulWidget {
  final String type;

  const AddPost({Key key, this.type}) : super(key: key);
  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('made it'),
    );
  }
}