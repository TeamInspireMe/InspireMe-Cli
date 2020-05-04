import 'dart:io';
import 'package:flutter/material.dart';
import 'package:inspire_me/class/postclass.dart';
import 'package:inspire_me/class/user.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'addbutton.dart';
import './home.dart';
import '../library/globals.dart' as globals;

class AddPost extends StatefulWidget {
  final Type type;
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
        globals.listPosts.length + 1,
        title,
        DateTime.now(),
        0,
        0,
        [],
        content,
        section,
        globals.currentUser,
        widget.type));
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

  setContent(text) {
    setState(() {
      content = text;
    });
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
          "${enumToString(widget.type)} Post",
          style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
          FlatButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  
                  post(section, title, content);
                }
              },
              child: Text(
                'Post',
                style: TextStyle(color: Colors.orange, fontSize: 20),
              ))
        ],
      ),
      resizeToAvoidBottomInset :false,
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.6),
              padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
              child: DropdownButtonFormField<Section>(
                isExpanded: false,
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
                      value: classType,
                      child: Text(enumToString(classType)));
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
            Content(widget.type, setContent),
          ],
        ),
      ),
    );
  }
}

class Content extends StatefulWidget {
  final Type type;
  final Function setContent;

  Content(this.type, this.setContent);

  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<Content> {
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    Directory directory = await getApplicationDocumentsDirectory();

    final File newImage =
        await image.copy('${directory.path}/post${globals.cpt}.png');

    globals.cpt++;

    widget.setContent(newImage.path);

    setState(() {
      _image = image;
    });
  }

  _library() {
    getImage();
  }

  _camera() {}

  @override
  Widget build(BuildContext context) {
    if (widget.type == Type.Text) {
      return Flexible(
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
          child: TextFormField(
              onChanged: (text) {
                widget.setContent(text);
              },
              decoration: InputDecoration.collapsed(
                hintText: 'Your inspirationnal text... (optionnal)',
              )),
        ),
      );
    } else if (widget.type == Type.Photo) {
      return Flexible(
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Column(
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          height: 90,
                          width: 90,
                          child: FloatingActionButton(
                            backgroundColor: Colors.red,
                            child: Icon(
                              Icons.camera_alt,
                              size: 50,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              _camera();
                            },
                            heroTag: "photo",
                          ),
                        ),
                        Text(
                          'Camera',
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          height: 90,
                          width: 90,
                          child: FloatingActionButton(
                            backgroundColor: Colors.red,
                            child: Icon(
                              Icons.photo_library,
                              color: Colors.white,
                              size: 50,
                            ),
                            onPressed: () {
                              _library();
                            },
                            heroTag: "library",
                          ),
                        ),
                        Text('Library', style: TextStyle(fontSize: 16))
                      ],
                    ),
                  ]),
              SizedBox(
                height: 25,
              ),
              _image == null
                  ? Text('No image selected.')
                  : Expanded(child: Image.file(_image,fit: BoxFit.cover,))
            ],
          ),
        ),
      );
    }
  }
}
