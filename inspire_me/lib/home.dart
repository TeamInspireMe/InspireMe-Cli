import 'package:flutter/material.dart';
import './category.dart';
import './post.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.apps),
          //tooltip: 'Next page',
          onPressed: () {},
          color: Colors.black,
        ),
        title:
            Text('Home', style: TextStyle(color: Colors.black, fontSize: 25)),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            //tooltip: 'Next page',
            onPressed: () {},
            color: Colors.black,
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            //tooltip: 'Next page',
            onPressed: () {},
            color: Colors.black,
          ),
          IconButton(
            icon: const Icon(Icons.account_circle),
            //tooltip: 'Next page',
            onPressed: () {},
            color: Colors.black,
          ),
        ],
        backgroundColor: Colors.white,
        bottom: PreferredSize(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(16)),
                    child: Category(name: 'Hot'),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(16),topLeft: Radius.circular(16)),
                    child: Category(name: 'New'),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(16)),
                    child: Category(name: 'Top'),
                  ),
                ),
              ],
            ),
            preferredSize: Size.fromHeight(25.0)),
        elevation: 0.0,
      ),
      body: Container(
          child: ListView(
        children: <Widget>[Post(), Post()],
      )),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.orange,
          onPressed: () {
            print('add');
          },
          child: Icon(Icons.add)),
    );
  }
}
