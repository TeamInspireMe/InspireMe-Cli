import 'package:flutter/material.dart';
import 'package:inspire_me/class/hexcolors.dart';
import '../library/globals.dart' as globals;

import 'home.dart';
import 'login.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  String username;
  String email;
  String password;
  String confirmPassword;

  register() {
    print('register');
    //globals.isLogged = true;
  }

  goToLogin() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Login(),
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
      body: SingleChildScrollView(
        reverse: true,
        child: ConstrainedBox(
          constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height - 56 -
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
                  child: Form(
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
                        },
                        onChanged: (text) {
                          setState(() {
                            username = text;
                          });
                        },),
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
                        child: TextFormField(validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your email';
                          }else if(RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)){
                            return 'Please enter a correct email';
                          }
                          return null;
                        },
                        onChanged: (text) {
                          setState(() {
                            email = text;
                          });
                        },),
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
                        child: TextFormField(validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your title';
                          }
                          return null;
                        },
                        onChanged: (text) {
                          setState(() {
                            title = text;
                          });
                        },),
                      ),
                      Text('Confirm Password', style: TextStyle(fontSize: 20)),
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
                            return 'Please enter your title';
                          }
                          return null;
                        },
                        onChanged: (text) {
                          setState(() {
                            title = text;
                          });
                        },)),
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
