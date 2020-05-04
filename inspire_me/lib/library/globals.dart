library my_prj.globals;

import 'package:inspire_me/class/postclass.dart';
import 'package:inspire_me/class/user.dart';

bool isLogged = false;

int cpt = 10;

List<Post> listPosts = [
  Post(
      1,
      '1st Post',
      DateTime(2020, 04, 30, 13, 00),
      52,
      3,
      [
        Comment(
            User(id: 2,email:'thomas@email.fr', username:'Thomas', password:'password',
          createdAt: DateTime(2020, 04, 30, 13, 00), profilPic:'profilPic'),
            '1st comment',
            DateTime(2020, 04, 30, 12, 30))
      ],
      './assets/post1.png',
      Section.Travels,
      User(id: 2,email:'thomas@email.fr', username:'Thomas', password:'password',
          createdAt: DateTime(2020, 04, 30, 13, 00), profilPic:'profilPic'),
      Type.Photo),
  Post(
      2,
      '2nd Post',
      DateTime(2020, 04, 29, 23, 45),
      15,
      1,
      [
        Comment(
           User(id: 2,email:'thomas@email.fr', username:'Thomas', password:'password',
          createdAt: DateTime(2020, 04, 30, 13, 00), profilPic:'profilPic'),
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            DateTime(2020, 04, 28, 12, 00)),
        Comment(
            User(id: 2,email:'thomas@email.fr', username:'Thomas', password:'password',
          createdAt: DateTime(2020, 04, 30, 13, 00), profilPic:'profilPic'),
            '2nd comment',
            DateTime(2020, 04, 30, 14, 12))
      ],
      './assets/newpost.png',
      Section.Funny,
      User(id: 2,email:'thomas@email.fr', username:'Thomas', password:'password',
          createdAt: DateTime(2020, 04, 30, 13, 00), profilPic:'profilPic'),
      Type.Photo),
  Post(
      3,
      '3rd Post',
      DateTime(
        2020,
        04,
        30,
        23,
      ),
      154,
      43,
      [],
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      Section.Motivation,
     User(id: 2,email:'thomas@email.fr', username:'Thomas', password:'password',
          createdAt: DateTime(2020, 04, 30, 13, 00), profilPic:'profilPic'),
      Type.Text),
];

User currentUser;

String url='https://inspire-me-app.herokuapp.com';

String urlAndroid='http://10.0.2.2:8080/api';
