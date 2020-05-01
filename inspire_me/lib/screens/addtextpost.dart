import 'package:flutter/material.dart';

class AddTextPost extends StatefulWidget {
  final String type;

  AddTextPost(this.type);
  @override
  _AddTextPostState createState() => _AddTextPostState();
}

class _AddTextPostState extends State<AddTextPost> {
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
