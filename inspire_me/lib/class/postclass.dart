import './user.dart';

class Post {
  String title;
  DateTime hour;
  int upVote;
  int downVote;
  List<Comment> comments;
  String content;
  Section category;
  bool upVoted = false;
  bool downVoted = false;
  User user;
  Type type;

  Post(
    this.title,
    this.hour,
    this.upVote,
    this.downVote,
    this.comments,
    this.content,
    this.category,
    this.user,
    this.type,
    );
}

class Comment{
  String text;
  DateTime createdAt;
  User user;
  
  Comment(this.user,this.text,this.createdAt);
}

enum Section{Science,Travels,Funny,Motivation}

enum Type{Text,Video,Photo}

String enumToString(Object o) => o.toString().split('.').last;