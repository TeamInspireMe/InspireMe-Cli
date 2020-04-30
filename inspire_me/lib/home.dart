import 'package:flutter/material.dart';
import './post.dart';
import './add.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  add(){
    print('adding post');
  }
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
            children: <Widget>[Post(false), Post(false)],//remplacer par list.map((post)=> function(post).toList()), later
          ),
          ListView(
            children: <Widget>[Post(false), Post(false)],
          ),
          ListView(
            children: <Widget>[Post(false), Post(false)],
          ),
        ]),
        floatingActionButton: AddButton(add:add)
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String name;
  Category({this.name});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        name,
        style: TextStyle(fontSize: 20, color: Colors.black),
      ),
    );
  }
}