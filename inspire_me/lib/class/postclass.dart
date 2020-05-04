import './user.dart';

class Post {
  int id;
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
    this.id,
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
  int id;
  String text;
  DateTime createdAt;
  User user;
  
  Comment(this.user,this.text,this.createdAt);
}

enum Section{Science,Travels,Funny,Motivation}

enum Type{Text,Video,Photo}

enum Redirect{Home,Post}

String enumToString(Object o) => o.toString().split('.').last;

isInSection(String str) {
    for (Section cat in Section.values) {
        if (enumToString(cat)==str)
            return true;
    }
    return false;
}