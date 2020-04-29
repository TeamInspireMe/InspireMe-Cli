import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  String name;
  Category({this.name});

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  bool pressed = false;
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        '${widget.name}',
        style: TextStyle(fontSize: 20, color: Colors.black),
      ),
    );
  }
}
