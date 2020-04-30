import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import './postdetailedview.dart';
import '../class/postclass.dart';

class PostView extends StatefulWidget {
  final bool isView;
  final Post post;
  PostView(this.isView, this.post);
  @override
  _PostViewState createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {

  void interact(state, action) {
    if (state == false) {
      setState(() {
        if (action == 'likes') {
          widget.post.likes += 1;
           widget.post.liked = true;
        } else if (action == 'dislikes') {
           widget.post.dislikes += 1;
           widget.post.disliked = true;
        }
      });
    } else if (state == true) {
      setState(() {
        if (action == 'likes') {
           widget.post.likes -= 1;
           widget.post.liked = false;
        } else if (action == 'dislikes') {
           widget.post.dislikes -= 1;
           widget.post.disliked = false;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    int difference = DateTime.now().difference(widget.post.hour).inHours;

    return GestureDetector(
      onTap: () {
          if(!widget.isView) 
           Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PostDetailedView(widget.post)),
          );
        },
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 2.0),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('${widget.post.title}', style: TextStyle(fontSize: 30.0)),
                    Column(
                      children: <Widget>[
                        Text('${widget.post.category}',
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.grey)),
                        Text('${difference}h ago',
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.grey)),
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
                      interact(widget.post.liked, 'likes');
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        SvgPicture.asset(
                          'icons/uparrow.svg',
                          color: widget.post.liked ? Colors.orange : Colors.grey,
                        ),
                        Text('${widget.post.likes}',
                            style: TextStyle(
                                color: widget.post.liked ? Colors.orange : Colors.grey))
                      ],
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      interact(widget.post.disliked, 'dislikes');
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        SvgPicture.asset(
                          'icons/downarrow.svg',
                          color: widget.post.disliked ? Colors.red : Colors.grey,
                        ),
                        Text('${widget.post.dislikes}',
                            style: TextStyle(
                                color: widget.post.disliked ? Colors.red : Colors.grey))
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
                        Text('${widget.post.comments.length}',
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
          padding: EdgeInsets.only(bottom:0),
        ),
      ),
    );
  }
}

