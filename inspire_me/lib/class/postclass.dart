import './user.dart';

class Post {
  String title;
  DateTime hour;
  int likes;
  int dislikes;
  List<Comment> comments;
  String content;
  Section category;
  bool liked = false;
  bool disliked = false;
  User user;
  Type type;

  Post(
    this.title,
    this.hour,
    this.likes,
    this.dislikes,
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