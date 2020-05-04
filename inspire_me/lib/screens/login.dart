import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:inspire_me/class/api.dart';
import 'package:inspire_me/class/hexcolors.dart';
import 'package:inspire_me/class/postclass.dart';
import 'package:inspire_me/class/user.dart';
import 'package:inspire_me/screens/postdetailedview.dart';
import 'package:inspire_me/screens/register.dart';
import '../library/globals.dart' as globals;
import '../library/graphql.dart' as graphql;
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'home.dart';

class Login extends StatefulWidget {
  final Redirect redirect;
  final Post post;

  const Login({Key key, this.redirect, this.post}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _loginKey = GlobalKey<FormState>();
  String email;
  String password;

  login() {
    FocusScope.of(context).unfocus();
    if (_loginKey.currentState.validate()) {
      setState(() {
        createUser().then((User user) {
          setState(() {
            globals.currentUser = user;
            globals.isLogged = true;
            endAction();
          });
        });
      });
    }
  }

  Future<User> createUser() async {
    final http.Response response = await http.post(
      '${globals.url}/api/auth/signin',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'email': email, 'password': password}),
    );
    if (response.statusCode == 201) {
      var api = Api.fromJson(json.decode(response.body));
      print(User.fromJson(api.data['user']));
      return (User.fromJson(api.data['user']));
    } else {
      throw Exception('Failed to create user');
    }
  }

  endAction() {
    if (widget.redirect == Redirect.Home) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => GraphQLProvider(client:graphql.client, child: Home())),
      );
    } else if (widget.redirect == Redirect.Post) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PostDetailedView(post: widget.post)),
      );
    }
  }

  goToRegister() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Register(
            redirect: widget.redirect,
            post: widget.post,
          ),
        ));
  }

  forgotPassword() {
    print('forgot');
  }

  //MediaQuery.of(context).size.width * 2 / 3

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              endAction();
            }),
        elevation: 0,
        backgroundColor: HexColor('#F25C54'),
        centerTitle: true,
        title: Text(
          'LOGGING',
          style: TextStyle(
            fontSize: 40,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height -
                  56 -
                  MediaQuery.of(context).padding.top),
          child: Container(
            color: HexColor('#F25C54'),
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('assets/inspiration.png'),
                        Text(
                          'IN',
                          style: TextStyle(fontSize: 40),
                        ),
                      ]),
                ),
                Expanded(
                  flex: 3,
                  child: Form(
                      key: _loginKey,
                      child: Column(
                        children: <Widget>[
                          Text('Email', style: TextStyle(fontSize: 20)),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                            ),
                            margin: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.15,
                                vertical: 10),
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter your email';
                                } else if (!RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value)) {
                                  return 'Please enter a correct email';
                                }
                                return null;
                              },
                              onChanged: (text) {
                                setState(() {
                                  email = text;
                                });
                              },
                            ),
                          ),
                          Text('Password', style: TextStyle(fontSize: 20)),
                          Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10)),
                              ),
                              margin: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.15,
                                  vertical: 10),
                              child: TextFormField(
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter your password';
                                  }
                                  return null;
                                },
                                onChanged: (text) {
                                  setState(() {
                                    password = text;
                                  });
                                },
                              )),
                          SizedBox(height: 20),
                          Container(
                            width: 175,
                            child: RawMaterialButton(
                              fillColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(color: Colors.red)),
                              onPressed: () {
                                login();
                              },
                              child: Text('Login'),
                            ),
                          ),
                          FlatButton(
                              onPressed: () {
                                forgotPassword();
                              },
                              child: Text('Forgot password ?',
                                  style: TextStyle(fontSize: 15))),
                          FlatButton(
                              onPressed: () {
                                goToRegister();
                              },
                              child: Text("Don't have an account ?",
                                  style: TextStyle(fontSize: 15)))
                        ],
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
