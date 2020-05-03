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
            User(1,'email', 'Steeve', 'password', DateTime(2020, 05, 01, 13, 00),
                'profilPic'),
            '1st comment',
            DateTime(2020, 04, 30, 12, 30))
      ],
      './assets/post1.png',
      Section.Travels,
      User(2,'thomas@email.fr', 'Thomas', 'password',
          DateTime(2020, 04, 30, 13, 00), 'profilPic'),
      Type.Photo),
  Post(
      2,
      '2nd Post',
      DateTime(2020, 04, 29, 23, 45),
      15,
      1,
      [
        Comment(
            User(3,'email', 'Pierre', 'password', DateTime(2020, 05, 01, 13, 00),
                'profilPic'),
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            DateTime(2020, 04, 28, 12, 00)),
        Comment(
            User(4,'email', 'Gab', 'password', DateTime(2020, 05, 01, 13, 00),
                'profilPic'),
            '2nd comment',
            DateTime(2020, 04, 30, 14, 12))
      ],
      './assets/newpost.png',
      Section.Funny,
      User(5,'jean@email.fr', 'Jean', 'password', DateTime(2020, 04, 31, 13, 00),
          'profilPic'),
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
      User(6,'marc@email.fr', 'Marc', 'password', DateTime(2020, 04, 31, 10, 00),
          'profilPic'),
      Type.Text),
];

User currentUser;

List<User> listUsers = [
  User(1,'email', 'Steeve', 'password', DateTime(2020, 05, 01, 13, 00),
      'profilPic'),
  User(2,'thomas@email.fr', 'Thomas', 'password', DateTime(2020, 04, 30, 13, 00),
      'profilPic'),
  User(3,'jean@email.fr', 'Jean', 'password', DateTime(2020, 04, 31, 13, 00),
      'profilPic'),
  User(4,'marc@email.fr', 'Marc', 'password', DateTime(2020, 04, 31, 10, 00),
      'profilPic'),
  User(5,'email', 'Gab', 'password', DateTime(2020, 05, 01, 13, 00), 'profilPic'),
];
