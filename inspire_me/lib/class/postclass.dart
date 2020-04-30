class Post {
  String title;
  DateTime hour;
  int likes;
  int dislikes;
  List<Comment> comments;
  String url;
  String category;
  bool liked = false;
  bool disliked = false;
  String user;

  Post(
    this.title,
    this.hour,
    this.likes,
    this.dislikes,
    this.comments,
    this.url,
    this.category,
    this.user
    );
}

class Comment{
  String text;
  DateTime hour;
  String user;
  
  Comment(this.user,this.text,this.hour);
}

class Category{
  //TODO
}