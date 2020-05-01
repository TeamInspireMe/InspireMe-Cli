import 'package:flutter/material.dart';
import './postview.dart';
import './addbutton.dart';
import '../class/postclass.dart';
import '../class/user.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Post> listPosts = [
    Post(
        '1st Post',
        DateTime(2020, 04, 30, 13, 00),
        52,
        3,
        [
          Comment(
              User('email', 'Steeve', 'password',
                  DateTime(2020, 05, 01, 13, 00), 'profilPic'),
              '1st comment',
              DateTime(2020, 04, 30, 12, 30))
        ],
        './assets/post1.png',
        Section.Travels,
        User('thomas@email.fr', 'Thomas', 'password',
            DateTime(2020, 04, 30, 13, 00), 'profilPic'),
        Type.Photo),
    Post(
        '2nd Post',
        DateTime(2020, 04, 29, 23, 45),
        15,
        1,
        [
          Comment(
              User('email', 'Pierre', 'password',
                  DateTime(2020, 05, 01, 13, 00), 'profilPic'),
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
              DateTime(2020, 04, 28, 12, 00)),
          Comment(
              User('email', 'Gab', 'password', DateTime(2020, 05, 01, 13, 00),
                  'profilPic'),
              '2nd comment',
              DateTime(2020, 04, 30, 14, 12))
        ],
        './assets/post1.png',
        Section.Funny,
        User('jean@email.fr', 'Jean', 'password',
            DateTime(2020, 04, 31, 13, 00), 'profilPic'),
        Type.Photo),
    Post(
        '3rd Post',
        DateTime(
          2020,
          04,
          30,
          23,
        ),
        154,
        43,
        [],
        './assets/post1.png',
        Section.Motivation,
        User('marc@email.fr', 'Marc', 'password',
            DateTime(2020, 04, 31, 10, 00), 'profilPic'),
        Type.Photo),
  ];

  add() {
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
              bottom: TabBar(indicatorColor: Colors.red, tabs: [
                Category(name: 'Hot'),
                Category(name: 'New'),
                Category(name: 'Top'),
              ])),
          body: TabBarView(children: [
            ListView(
              children: listPosts.map((post) => PostView(false, post)).toList(),
            ),
            ListView(
              children: listPosts.map((post) => PostView(false, post)).toList(),
            ),
            ListView(
              children: listPosts.map((post) => PostView(false, post)).toList(),
            ),
          ]),
          floatingActionButton: AddButton()),
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
