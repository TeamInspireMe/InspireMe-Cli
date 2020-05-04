import 'package:flutter/material.dart';
import 'package:inspire_me/class/user.dart';
import 'package:inspire_me/screens/profile.dart';
import './postview.dart';
import './addbutton.dart';
import '../class/postclass.dart';
import '../library/globals.dart' as globals;
import 'login.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  add(Post post) {
    //globals.listPosts.add(post);
  }

  String getPostsQuery = """ 
  query {
    getAllPost {
      uuid,
      data,
      title,
      section {
        id,
        name
      },
      type {
        name
      }
      upVote,
      downVote,
      createdAt
    }
  }
""";

  account() {
    if (!globals.isLogged) {
      goToLogin();
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Profile(),
          ));
    }
  }

  goToLogin() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Login(
            redirect: Redirect.Home,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.apps),
                //tooltip: 'Next page',
                onPressed: () {},
                color: Colors.black,
              ),
              title: Text('Home',
                  style: TextStyle(color: Colors.black, fontSize: 25)),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.search),
                  //tooltip: 'Next page',
                  onPressed: () {},
                  color: Colors.black,
                ),
                IconButton(
                  icon: const Icon(Icons.notifications),
                  //tooltip: 'Next page',
                  onPressed: () {},
                  color: Colors.black,
                ),
                IconButton(
                  icon: const Icon(Icons.account_circle),
                  //tooltip: 'Next page',
                  onPressed: () {
                    account();
                  },
                  color: Colors.black,
                ),
              ],
              backgroundColor: Colors.white,
              bottom: TabBar(indicatorColor: Colors.red, tabs: [
                Category(name: 'Hot'),
                Category(name: 'New'),
                Category(name: 'Top'),
              ])),
          body: Query(
              options: QueryOptions(documentNode: gql(getPostsQuery)),
              builder: (
                QueryResult result, {
                Refetch refetch,
                FetchMore fetchMore,
              }) {
                //globals.listPosts = result.data['getAllPost'];
                if (result.data == null ||
                    result.data['getAllPost'][0] == null ||
                    result.data['getAllPost'] == null) {
                  return Center(
                      child: Text(
                    'No Posts Avalaibles !',
                    style: TextStyle(fontSize: 25),
                  ));
                } else {
                  return TabBarView(children: [
                    ListView.builder(
                      itemCount: result.data['getAllPost'].length,
                      itemBuilder: (BuildContext context, int index) {
                        var data = result.data['getAllPost'][index];
                        Type _type = Type.values.firstWhere((e) =>
                            enumToString(e).toLowerCase() ==
                            data['type']['name']);
                        Section _section = Section.values.firstWhere((e) =>
                            enumToString(e).toLowerCase() ==
                            data['section']['name']);
                        DateTime _createdAt =
                            DateTime.parse(data['createdAt'].toString());
                        Post post = new Post(
                            data['uuid'],
                            data['title'],
                            _createdAt,
                            data['upVote'],
                            data['downVote'],
                            [],
                            data['data'],
                            _section,
                            User(
                                id: '2',
                                email: 'thomas@email.fr',
                                username: 'Thomas',
                                password: 'password',
                                createdAt: DateTime(2020, 04, 30, 13, 00),
                                profilPic: 'profilPic'),
                            _type);
                        return PostView(
                          isView: false,
                          post: post,
                          redirect: Redirect.Home,
                        );
                      },
                      //PostView(isView: false, post: post,redirect: Redirect.Home,)
                    ),
                    ListView.builder(
                      itemCount: result.data['getAllPost'].length,
                      itemBuilder: (BuildContext context, int index) {
                        var data = result.data['getAllPost'][index];
                        Type _type = Type.values.firstWhere((e) =>
                            enumToString(e).toLowerCase() ==
                            data['type']['name']);
                        Section _section = Section.values.firstWhere((e) =>
                            enumToString(e).toLowerCase() ==
                            data['section']['name']);
                        DateTime _createdAt =
                            DateTime.parse(data['createdAt'].toString());
                        Post post = new Post(
                            data['uuid'],
                            data['title'],
                            _createdAt,
                            data['upVote'],
                            data['downVote'],
                            [],
                            data['data'],
                            _section,
                            User(
                                id: '2',
                                email: 'thomas@email.fr',
                                username: 'Thomas',
                                password: 'password',
                                createdAt: DateTime(2020, 04, 30, 13, 00),
                                profilPic: 'profilPic'),
                            _type);
                        return PostView(
                          isView: false,
                          post: post,
                          redirect: Redirect.Home,
                        );
                      },
                      //PostView(isView: false, post: post,redirect: Redirect.Home,)
                    ),
                    ListView.builder(
                      itemCount: result.data['getAllPost'].length,
                      itemBuilder: (BuildContext context, int index) {
                        var data = result.data['getAllPost'][index];
                        Type _type = Type.values.firstWhere((e) =>
                            enumToString(e).toLowerCase() ==
                            data['type']['name']);
                        Section _section = Section.values.firstWhere((e) =>
                            enumToString(e).toLowerCase() ==
                            data['section']['name']);
                        DateTime _createdAt =
                            DateTime.parse(data['createdAt'].toString());
                        Post post = new Post(
                            data['uuid'],
                            data['title'],
                            _createdAt,
                            data['upVote'],
                            data['downVote'],
                            [],
                            data['data'],
                            _section,
                            User(
                                id: '2',
                                email: 'thomas@email.fr',
                                username: 'Thomas',
                                password: 'password',
                                createdAt: DateTime(2020, 04, 30, 13, 00),
                                profilPic: 'profilPic'),
                            _type);
                        return PostView(
                          isView: false,
                          post: post,
                          redirect: Redirect.Home,
                        );
                      },
                      //PostView(isView: false, post: post,redirect: Redirect.Home,)
                    ),
                  ]);
                }
              }),
          floatingActionButton: AddButton(add)),
    );
  }
}

class Category extends StatelessWidget {
  final String name;
  Category({this.name});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        name,
        style: TextStyle(fontSize: 20, color: Colors.black),
      ),
    );
  }
}
