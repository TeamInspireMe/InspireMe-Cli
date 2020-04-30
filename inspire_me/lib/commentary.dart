import 'package:flutter/material.dart';

class CommentView extends StatefulWidget {
  @override
  _CommentViewState createState() => _CommentViewState();
}

class _CommentViewState extends State<CommentView> {
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.symmetric(vertical: 1.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:5.0),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Row(
                  children: <Widget>[
                    Text('username',style:TextStyle(fontWeight:FontWeight.bold,fontSize: 15)),
                    SizedBox(width: 5), 
                    Text('hour ago',style: TextStyle(color:Colors.grey),)],
                ),
                IconButton(
                  icon: const Icon(Icons.more_vert),
                  //tooltip: 'Next page',
                  onPressed: () {},
                  color: Colors.black,
                )
              ]),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 15.0),
                child: Center(child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
                  ,style: TextStyle(fontSize:20.0),)),
              )
            ],
          ),
        ));
  }
}
