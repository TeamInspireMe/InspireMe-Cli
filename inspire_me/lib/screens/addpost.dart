import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:inspire_me/class/api.dart';
import 'package:inspire_me/class/postclass.dart';
import 'package:inspire_me/class/user.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'addbutton.dart';
import './home.dart';
import '../library/globals.dart' as globals;
import '../library/graphql.dart' as graphql;
import 'package:http/http.dart' as http;

class AddPost extends StatefulWidget {
  final Type type;

  AddPost(this.type);
  @override
  _AddTextState createState() => _AddTextState();
}

class _AddTextState extends State<AddPost> {
  final _formKey = GlobalKey<FormState>();
  Section _section;
  String title;
  String content;

    Future<Api> postImage() async {
      print(globals.token);
    final http.Response response = await http.post(
      '${globals.url}/api/post/uploadPic',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: 'Bearer ${globals.token}',
      },
      body: jsonEncode(<String, String>{
        'title': title, 
        'sectionId':_section.id.toString(),
        'userId':globals.currentUser.id,
        'file':content
        }),
    ).timeout(const Duration(seconds: 10));
    print(response.statusCode);
    if (response.statusCode == 201) {
      var api = Api.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to upload pic');
    }
  }

  post() {
    FocusScope.of(context).unfocus();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                GraphQLProvider(client: graphql.client, child: Home())));
  }

  String _validateSection(Section _section) {
    if (_section == null) {
      return 'Please select a category';
    }
    return null;
  }

  String getSections = """
      query {
  getAllSection {
    id,
    name
  }
}
  """;

  String addPostQuery = r'''
        mutation addPost($title: String!, $typeId: Int!, $sectionId: Int!, $data: String!, $userId:String!){
  createPost(title: $title, typeId: $typeId, sectionId: $sectionId, data: $data,userId: $userId) {
  	uuid,
    data,
    title,
    createdAt,
    section{
      id,
      name
    }
  }
}
  ''';

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
          Mutation(
              options: MutationOptions(
                documentNode: gql(addPostQuery),
                onCompleted: (dynamic resultdata){
                  post();
                }),
              builder: (RunMutation insert, QueryResult result) {
                return FlatButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        if(widget.type==Type.Quote){
                        insert(<String ,dynamic >
                        {
                          "title": title,
                          "typeId": 1,
                          "sectionId": _section.id,
                          "data": content,
                          "userId":
                             globals.currentUser.id
                        });
                        }else{
                          print(widget.type);
                          postImage();
                        }
                      }
                    },
                    child: Text(
                      'Post',
                      style: TextStyle(color: Colors.orange, fontSize: 20),
                    ));
              },
              ),
        ],
      ),
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.6),
              padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
              child: Query(
                  options: QueryOptions(documentNode: gql(getSections)),
                  builder: (
                    QueryResult result, {
                    Refetch refetch,
                    FetchMore fetchMore,
                  }) {
                    if (result.data == null) {
                      return Text('Error no sections avalaible');
                    } else {
                      List<Section> sections = [];
                      for (var i = 0;
                          i < result.data['getAllSection'].length;
                          i++) {
                        sections.add(
                            Section.fromJson(result.data['getAllSection'][i]));
                      }
                      return DropdownButtonFormField<Section>(
                          isExpanded: false,
                          value: null,
                          hint: (Text(_section == null
                              ? 'Select your category'
                              : _section.name)),
                          validator: _validateSection,
                          decoration: InputDecoration.collapsed(hintText: ''),
                          icon: Icon(Icons.keyboard_arrow_down),
                          onChanged: (Section newSection) {
                            setState(() {
                              _section = newSection;
                            });
                          },
                          items: sections.map((Section _section) {
                            return DropdownMenuItem<Section>(
                                value: _section, child: Text(_section.name));
                          }).toList());
                    }
                  }),
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
    if (widget.type == Type.Quote) {
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
    } else if (widget.type == Type.Picture) {
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
                  : Expanded(
                      child: Image.file(
                      _image,
                      fit: BoxFit.cover,
                    ))
            ],
          ),
        ),
      );
    }
  }
}
