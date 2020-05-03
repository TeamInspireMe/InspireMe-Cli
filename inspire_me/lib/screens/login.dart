import 'package:flutter/material.dart';
import 'package:inspire_me/class/hexcolors.dart';
import 'package:inspire_me/screens/register.dart';
import '../library/globals.dart' as globals;

import 'home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;

  login() {
    print('login');
    globals.isLogged = true;
  }

  goToRegister() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Register(),
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
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter your email';
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
