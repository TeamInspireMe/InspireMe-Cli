import 'package:json_annotation/json_annotation.dart';
import './api.dart';

class UserResponse {
  User user;

  UserResponse({this.user});

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      user: User.fromJson(json['user']),
    );
  }
}

@JsonSerializable(nullable: false)
class User {
  String id;
  String email;
  String username;
  String password;
  DateTime createdAt;
  String profilPic;
  
  User(
      {this.id,
      this.email,
      this.username,
      this.password,
      this.createdAt,
      this.profilPic});

  factory User.fromJson(Map<String, dynamic> json) {

    return User(
      id: json['uuid'],
      email: json['email'],
      username: json['username'],
      password: json['password'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}
