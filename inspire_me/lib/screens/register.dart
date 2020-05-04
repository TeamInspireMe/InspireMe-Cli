import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:inspire_me/class/api.dart';
import 'package:inspire_me/class/hexcolors.dart';
import 'package:inspire_me/class/user.dart';
import '../library/globals.dart' as globals;
import 'package:http/http.dart' as http;

import 'home.dart';
import 'login.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _signUpKey = GlobalKey<FormState>();
  String username;
  String email;
  String password;
  String confirmPassword;
  bool hasErrors = false;

  register() {
    FocusScope.of(context).unfocus();
    if (_signUpKey.currentState.validate()) {
      setState(() {
        hasErrors = false;
        createUser().then((User user) {
          setState(() {
            globals.currentUser = user;
            globals.isLogged = true;
            print(globals.currentUser.username);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          });
        });
      });
    } else {
      setState(() {
        hasErrors = true;
      });
    }
  }

  Future<User> createUser() async {
    final http.Response response = await http.post(
      '${globals.url}/auth/signup',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'email': email,
        'password': password
      }),
    );
    if (response.statusCode == 201) {
      var api = Api.fromJson(json.decode(response.body));
      print(User.fromJson(api.data['user']));
      return (User.fromJson(api.data['user']));
    } else {
      throw Exception('Failed to create user');
    }
  }

  goToLogin() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Login(),
        ));
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            }),
        elevation: 0,
        backgroundColor: HexColor('#F25C54'),
        centerTitle: true,
        title: Text(
          'SIGN',
          style: TextStyle(
            fontSize: 40,
            color: Colors.black,
          ),
        ),
      ),
      body: Form(
        key: _signUpKey,
        child: SingleChildScrollView(
          reverse: true,
          child: ConstrainedBox(
            constraints: BoxConstraints(
                maxHeight: !hasErrors
                    ? MediaQuery.of(context).size.height -
                        56 -
                        MediaQuery.of(context).padding.top
                    : MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top),
            child: Container(
              color: HexColor('#F25C54'),
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset('assets/inspiration.png'),
                          Text(
                            'UP',
                            style: TextStyle(fontSize: 40),
                          ),
                        ]),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: <Widget>[
                        Text('Username', style: TextStyle(fontSize: 20)),
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
                          child: TextFormField(validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter your username';
                            }
                            return null;
                          }, onChanged: (text) {
                            setState(() {
                              username = text;
                            });
                          }),
                        ),
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
                              } else if (value.length < 8) {
                                return 'Please enter a password with at least 8 characters';
                              }
                              return null;
                            },
                            onChanged: (text) {
                              setState(() {
                                password = text;
                              });
                            },
                          ),
                        ),
                        Text('Confirm Password',
                            style: TextStyle(fontSize: 20)),
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
                                if (value != password) {
                                  return 'Passwords are not the same';
                                }
                                return null;
                              },
                              onChanged: (text) {
                                setState(() {
                                  confirmPassword = text;
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
                              register();
                            },
                            child: Text('Register'),
                          ),
                        ),
                        FlatButton(
                            onPressed: () {
                              goToLogin();
                            },
                            child: Text("Already have an account ?",
                                style: TextStyle(fontSize: 15)))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
