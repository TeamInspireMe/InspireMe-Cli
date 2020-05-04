import 'package:flutter/material.dart';
import './screens/home.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import './library/globals.dart' as globals;
import './library/graphql.dart' as graphql;

void main() {
  runApp(MaterialApp(home: Splash()));
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Material(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => GraphQLProvider(
                      client: graphql.client,
                      child: Home(),
                    )),
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
