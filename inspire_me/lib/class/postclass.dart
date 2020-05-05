import './user.dart';

class Post {
  String id;
  String title;
  DateTime hour;
  int upVote;
  int downVote;
  List<Comment> comments;
  int nbComments;
  String content;
  String category;
  bool upVoted = false;
  bool downVoted = false;
  User user;
  Type type;

  Post({
    this.id,
    this.title,
    this.hour,
    this.upVote,
    this.downVote,
    this.comments,
    this.nbComments,
    this.content,
    this.category,
    this.user,
    this.type,
  });
}

class Comment{
  int id;
  String text;
  DateTime createdAt;
  User user;
  
  Comment(this.user,this.text,this.createdAt);
}

class Section{
  int id;
  String name;
  Section({this.id,this.name});

  factory Section.fromJson(Map<String, dynamic> json){
    return Section(
      id: json['id'],
      name: json['name']
    );
  }
}

enum Type{Quote,Video,Picture}

enum Redirect{Home,Post}

String enumToString(Object o) => o.toString().split('.').last;