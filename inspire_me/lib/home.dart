import 'package:flutter/material.dart';
import './category.dart';
import './post.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:  IconButton(
          icon: const Icon(Icons.apps),
          //tooltip: 'Next page',
          onPressed: () {
            
          },
          color: Colors.black,
        ),
        title: Text(
          'Home',
          style: TextStyle(color: Colors.black, fontSize: 25)
          ),
        actions: <Widget>[
          IconButton(
          icon: const Icon(Icons.search),
          //tooltip: 'Next page',
          onPressed: () {
            
          },
          color: Colors.black,
        ),IconButton(
          icon: const Icon(Icons.notifications),
          //tooltip: 'Next page',
          onPressed: () {
            
          },
          color: Colors.black,
        ),
        IconButton(
          icon: const Icon(Icons.account_circle),
          //tooltip: 'Next page',
          onPressed: () {
            
          },
          color: Colors.black,
        ),

        ],
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: (){print('Hot');},
                child: Text('Hot',style: TextStyle(fontSize:20),)),
              GestureDetector(
                onTap: (){print('New');},
                child: Text('New',style: TextStyle(fontSize:20),)),
              GestureDetector(
                onTap: (){print('Top');},
                child: Text('Top',style: TextStyle(fontSize:20),)),
            ],
          ), 
          preferredSize: Size.fromHeight(25.0)),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Post(),
            Post()
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: (){
          print('add');
        },
        child: Icon(Icons.add)
      ),
    );
  }
}