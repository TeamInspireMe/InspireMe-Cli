import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(nullable: false)
class User{
  int id;
  String email;
  String username;
  String password;
  @JsonKey(fromJson: _rawDateTime)
  DateTime createdAt;
  String profilPic;

  static DateTime _rawDateTime(t) => t as DateTime;

  User({this.id,this.email,this.username,this.password,this.createdAt,this.profilPic});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['data.user.uuid'],
      email: json['data.user.email'],
      username: json['data.user.username'],
      password: json['data.user.password'],
      createdAt: json['data.user.createdAt'],      
    );
  }
}