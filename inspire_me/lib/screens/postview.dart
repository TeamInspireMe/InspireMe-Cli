import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import './postdetailedview.dart';
import '../class/postclass.dart';
import '../library/globals.dart' as globals;
import 'login.dart';

class PostView extends StatefulWidget {
  final bool isView;
  final Post post;
  final Redirect redirect;
  PostView({this.isView, this.post, this.redirect});
  @override
  _PostViewState createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  void interact(state, action) {
    if (!globals.isLogged) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Login(
              redirect: widget.redirect,
              post: widget.post,
            ),
          ));
    } else {
      if (state == false) {
        setState(() {
          if (action == 'likes') {
            widget.post.upVote += 1;
            widget.post.upVoted = true;
          } else if (action == 'dislikes') {
            widget.post.downVote += 1;
            widget.post.downVoted = true;
          }
        });
      } else if (state == true) {
        setState(() {
          if (action == 'likes') {
            widget.post.upVote -= 1;
            widget.post.upVoted = false;
          } else if (action == 'dislikes') {
            widget.post.downVote -= 1;
            widget.post.downVoted = false;
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    int difference = DateTime.now().difference(widget.post.hour).inHours;
    bool isMedia = enumToString(widget.post.type) != 'Quote';
    return GestureDetector(
      onTap: () {
        if (!widget.isView)
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PostDetailedView(post: widget.post)),
          );
      },
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 2.0),
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 10, 0, 2),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('${widget.post.title}',
                        style: TextStyle(fontSize: 30.0)),
                    Column(
                      children: <Widget>[
                        Text('${enumToString(widget.post.category)}',
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
              isMedia
                  ? Image.asset('${widget.post.content}',
                      width: double.infinity, fit: BoxFit.cover)
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                          height: 200,
                          child: SingleChildScrollView(
                            child: Text(
                              '${widget.post.content}',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 23),
                            ),
                          )),
                    ),
              SizedBox(height: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      interact(widget.post.upVoted, 'likes');
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        SvgPicture.asset(
                          'icons/uparrow.svg',
                          color:
                              widget.post.upVoted ? Colors.orange : Colors.grey,
                        ),
                        Text('${widget.post.upVote}',
                            style: TextStyle(
                                color: widget.post.upVoted
                                    ? Colors.orange
                                    : Colors.grey))
                      ],
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      interact(widget.post.downVoted, 'dislikes');
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        SvgPicture.asset(
                          'icons/downarrow.svg',
                          color:
                              widget.post.downVoted ? Colors.red : Colors.grey,
                        ),
                        Text('${widget.post.downVote}',
                            style: TextStyle(
                                color: widget.post.downVoted
                                    ? Colors.red
                                    : Colors.grey))
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
          padding: EdgeInsets.only(bottom: 0),
        ),
      ),
    );
  }
}
