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
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.apps),
              //tooltip: 'Next page',
              onPressed: () {},
              color: Colors.black,
            ),
            title: Text('Home',
                style: TextStyle(color: Colors.black, fontSize: 25)),
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
            bottom: TabBar(tabs: [
              Category(name: 'Hot'),
              Category(name: 'New'),
              Category(name: 'Top'),
            ])),
        body: TabBarView(children: [
          ListView(
            children: <Widget>[Post(), Post()],//remplacer par list.map((post)=> function(post).toList()), later
          ),
          ListView(
            children: <Widget>[Post(), Post()],
          ),
          ListView(
            children: <Widget>[Post(), Post()],
          ),
        ]),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.orange,
            onPressed: () {
              print('add');
            },
            child: Icon(Icons.add)),
      ),
    );
  }
}
