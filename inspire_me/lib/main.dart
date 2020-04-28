import 'package:flutter/material.dart';
import 'home.dart';

void main() => runApp(MaterialApp(home: Splash()));

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Home()),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/Splash_screen.png'),
                fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}


