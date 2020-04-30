import 'package:flutter/material.dart';
import './postview.dart';
import './add.dart';
import './postclass.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Post> listPosts = [
    Post(
        '1st Post',
        DateTime(2020,04,30,13,00),
        52,
        3,
        [Comment('Steevo','1st comment', DateTime(2020,04,30,12,30))] ,
        './assets/post1.png',
        'voyages',
        'Thomas'),
    Post(
        '2nd Post',
        DateTime(2020,04,29,23,45),
        15,
        1,
        [
          Comment('Gab','Lorem ipsum dolor sit amet, consectetur adipiscing elit.', DateTime(2020,04,28,12,00)),
          Comment('Marc','2nd comment', DateTime(2020,04,30,14,12))
        ] ,
        './assets/post1.png',
        'funny',
        'Jean'),
    Post(
        '3rd Post',
        DateTime(2020,04,30,23,18),
        154,
        43,
        [] ,
        './assets/post1.png',
        'science',
        'Pierre'),
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
              children: listPosts.map((post) => PostView(false,post)).toList(),
            ),
            ListView(
              children: listPosts.map((post) => PostView(false,post)).toList(),
            ),
            ListView(
              children: listPosts.map((post) => PostView(false,post)).toList(),
            ),
          ]),
          floatingActionButton: AddButton(add: add)),
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
