import 'package:flutter/material.dart';

class AddMediaPost extends StatefulWidget {
  final String type;

  AddMediaPost(this.type);
  @override
  _AddMediaPostState createState() => _AddMediaPostState();
}

class _AddMediaPostState extends State<AddMediaPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        title: Text(
          "${widget.type} Post",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
