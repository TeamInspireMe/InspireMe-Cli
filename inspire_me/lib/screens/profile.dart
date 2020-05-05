import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../library/globals.dart' as globals;
import '../library/graphql.dart' as graphql;
import 'home.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  logout() {
    globals.isLogged = false;
    globals.currentUser = null;
    globals.token = null;
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GraphQLProvider(client: graphql.client, child: Home())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        centerTitle: true,
        title: Text(
          "Profile of ${globals.currentUser.username}",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Container(
          height: 50,
                  child: Center(
            child: Text(
            'Email: ${globals.currentUser.email}',
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          )),
        ),
        Divider(color: Colors.grey),
        FlatButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  GraphQLProvider(client: graphql.client, child: Home())));
          },
          child: Container(
            width: 175,
            child: RawMaterialButton(
              fillColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.red)),
              onPressed: () {
                logout();
              },
              child: Text('Logout'),
            ),
          ),
        )
      ]),
    );
  }
}
