import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  bool pressed = false;
  String name;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(name);
      },
      child: Text(
        name,
        style: TextStyle(fontSize: 20),
      ));
  }
}
