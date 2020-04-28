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
    return FlatButton(
        color:  pressed ?Colors.red:null,
        onPressed: () {
          print('${widget.name}');
          if(pressed==false){
            pressed = true;
          }else if(pressed == true){
              pressed = false;
          }
        },
        child: Text(
          '${widget.name}',
          style: TextStyle(fontSize: 20),
        ));
  }
}
