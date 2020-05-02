import 'package:flutter/material.dart';
import 'package:inspire_me/class/postclass.dart';
import 'addbutton.dart';

class AddTextPost extends StatefulWidget {
  final String type;
  final ConfirmCallback confirm;

  AddTextPost(this.type, this.confirm);
  @override
  _AddTextPostState createState() => _AddTextPostState();
}

class _AddTextPostState extends State<AddTextPost> {
  final _formKey = GlobalKey<FormState>();
  Section section;
  String title;
  String content;

  test(Section section, String title, String content) {
    print('${enumToString(section)} ${title} ${content}');
    FocusScope.of(context).unfocus();
  }

  String _validateSection(Section _section) {
    if(!isInSection(enumToString(_section))){
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
                  test(section, title, content);
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
                    /*validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter your title';
                      }
                      return null;
                    },*/
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
