import 'package:flutter/material.dart';
import './postview.dart';
import './addbutton.dart';
import '../class/postclass.dart';
import '../library/globals.dart' as globals;
import 'login.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  add(Post post) {
    globals.listPosts.add(post);
  }

  account() {
    if(!globals.isLogged){
      goToLogin();
    }else{
      
    }
  }

  goToLogin(){
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Login(),
        ));
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
                  onPressed: () {
                    account();
                  },
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
              children: globals.listPosts
                  .map((post) => PostView(false, post))
                  .toList(),
            ),
            ListView(
              children: globals.listPosts
                  .map((post) => PostView(false, post))
                  .toList(),
            ),
            ListView(
              children: globals.listPosts
                  .map((post) => PostView(false, post))
                  .toList(),
            ),
          ]),
          floatingActionButton: AddButton(add)),
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
