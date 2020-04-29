import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Post extends StatefulWidget {
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  String title = 'my post';
  int hour = 4;
  int likes = 43;
  int dislikes = 2;
  List<String> comments = ['très bien', 'merveilleux'];
  String url;
  String category = 'voyage';
  bool liked = false;
  bool disliked = false;

  void interact(state, action) {
    if (state == false) {
      setState(() {
        if (action == 'likes') {
          likes += 1;
          liked = true;
        } else if (action == 'dislikes') {
          dislikes += 1;
          disliked = true;
        }
      });
    } else if (state == true) {
      setState(() {
        if (action == 'likes') {
          likes -= 1;
          liked = false;
        } else if (action == 'dislikes') {
          dislikes -= 1;
          disliked = false;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('$title', style: TextStyle(fontSize: 30.0)),
                Column(
                  children: <Widget>[
                    Text('$category',
                        style: TextStyle(fontSize: 20.0, color: Colors.grey)),
                    Text('$hour h ago',
                        style: TextStyle(fontSize: 20.0, color: Colors.grey)),
                  ],
                ),
              ],
            ),
          ),
          Image.asset('assets/post1.png',
              width: double.infinity, fit: BoxFit.cover),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  interact(liked, 'likes');
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    SvgPicture.asset(
                      'icons/uparrow.svg',
                      color: liked ? Colors.orange : Colors.grey,
                    ),
                    Text('$likes',
                        style: TextStyle(
                            color: liked ? Colors.orange : Colors.grey))
                  ],
                ),
              ),
              FlatButton(
                onPressed: () {
                  interact(disliked, 'dislikes');
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    SvgPicture.asset(
                      'icons/downarrow.svg',
                      color: disliked ? Colors.red : Colors.grey,
                    ),
                    Text('$dislikes',
                        style: TextStyle(
                            color: disliked ? Colors.red : Colors.grey))
                  ],
                ),
              ),
              FlatButton(
                onPressed: () {},
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    SvgPicture.asset(
                      'icons/comment.svg',
                      color: Colors.grey,
                    ),
                    Text('${comments.length}',
                        style: TextStyle(color: Colors.grey))
                  ],
                ),
              ),
              FlatButton(
                onPressed: () {},
                child: Row(
                  children: <Widget>[
                    SvgPicture.asset(
                      'icons/share.svg',
                      color: Colors.grey,
                    ),
                    Text('Share', style: TextStyle(color: Colors.grey))
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
