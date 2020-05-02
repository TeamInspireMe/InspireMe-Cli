import 'package:flutter/material.dart';
import 'package:inspire_me/class/postclass.dart';
import 'package:inspire_me/class/user.dart';
import 'package:inspire_me/screens/home.dart';
import 'addbutton.dart';

class AddPost extends StatefulWidget {
  final String type;
  final ConfirmCallback confirm;

  AddPost(this.type, this.confirm);
  @override
  _AddTextState createState() => _AddTextState();
}

class _AddTextState extends State<AddPost> {
  final _formKey = GlobalKey<FormState>();
  Section section;
  String title;
  String content;

  post(Section section, String title, String content) {
    FocusScope.of(context).unfocus();
    widget.confirm(Post(
        title,
        DateTime.now(),
        0,
        0,
        [],
        content,
        section,
        User('email', 'Pierre', 'password', DateTime(2020, 05, 01, 13, 00),
            'profilPic'),
        Type.Text));
     Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Home(),
      ));
  }

  String _validateSection(Section _section) {
    if (!isInSection(enumToString(_section))) {
      return 'Please select a category';
    }
    return null;
  }

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
        actions: <Widget>[
          FlatButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  // If the form is valid, display a Snackbar.
                  post(section, title, content);
                }
              },
              child: Text(
                'Post',
                style: TextStyle(color: Colors.orange, fontSize: 20),
              ))
        ],
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(20, 10, 280, 0),
              child: DropdownButtonFormField<Section>(
                value: section,
                hint: (Text('Select your category')),
                validator: _validateSection,
                decoration: InputDecoration.collapsed(hintText: ''),
                icon: Icon(Icons.keyboard_arrow_down),
                onChanged: (Section newSection) {
                  setState(() {
                    section = newSection;
                  });
                },
                items: Section.values.map((Section classType) {
                  return DropdownMenuItem<Section>(
                      value: classType, child: Text(enumToString(classType)));
                }).toList(),
              ),
            ),
            Divider(color: Colors.grey),
            Flexible(
              child: Container(
                padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter your title';
                      }
                      return null;
                    },
                    onChanged: (text) {
                      setState(() {
                        title = text;
                      });
                    },
                    decoration: InputDecoration.collapsed(
                      hintText: 'Inspirationnal title',
                    )),
              ),
            ),
            Divider(color: Colors.grey),
            Flexible(
              child: Container(
                padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                child: TextFormField(
                    onChanged: (text) {
                      setState(() {
                        content = text;
                      });
                    },
                    decoration: InputDecoration.collapsed(
                      hintText: 'Your inspirationnal text... (optionnal)',
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
