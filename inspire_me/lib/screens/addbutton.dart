import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import './addpost.dart';
import '../class/postclass.dart';
import '../library/globals.dart' as globals;
import '../library/graphql.dart' as graphql;
import 'login.dart';

class AddButton extends StatefulWidget {
  @override
  _AddButtonState createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton>
    with SingleTickerProviderStateMixin {
  bool isOpened = false;
  AnimationController _animationController;
  Animation<Color> _buttonColor;
  Animation<double> _animateIcon;
  Animation<double> _translateButton;
  Curve _curve = Curves.easeOut;
  double _fabHeight = 56.0;

  @override
  initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addListener(() {
            setState(() {});
          });
    _animateIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _buttonColor = ColorTween(
      begin: Colors.orange,
      end: Colors.red,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.00,
        1.00,
        curve: Curves.linear,
      ),
    ));
    _translateButton = Tween<double>(
      begin: _fabHeight,
      end: -14.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.0,
        0.75,
        curve: _curve,
      ),
    ));
    super.initState();
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  animate() {
    if (!isOpened) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    isOpened = !isOpened;
  }

  add(Type type) {
    animate();
    if (globals.isLogged) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => GraphQLProvider(
                client: graphql.client, child: AddPost(type))),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Login(redirect: Redirect.Home)),
      );
    }
  }

  Widget photo() {
    return Container(
      child: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          add(Type.Picture);
        },
        tooltip: 'Picture',
        child: Icon(Icons.photo_library, color: Colors.red),
        heroTag: 'photo',
      ),
    );
  }

  Widget video() {
    return Container(
      child: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          add(Type.Video);
        },
        tooltip: 'Video',
        child: Icon(Icons.video_library, color: Colors.red),
        heroTag: 'video',
      ),
    );
  }

  Widget quote() {
    return Container(
      child: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          add(Type.Quote);
        },
        tooltip: 'Text',
        child: Icon(
          Icons.format_quote,
          color: Colors.red,
        ),
        heroTag: 'quote',
      ),
    );
  }

  Widget toggle() {
    return Container(
      child: FloatingActionButton(
        backgroundColor: _buttonColor.value,
        onPressed: animate,
        tooltip: 'Add a new post',
        child: AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: _animateIcon,
        ),
        heroTag: 'toggle',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value * 3.0,
            0.0,
          ),
          child: quote(),
        ),
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value * 2.0,
            0.0,
          ),
          child: photo(),
        ),
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value,
            0.0,
          ),
          child: video(),
        ),
        toggle(),
      ],
    );
  }
}

typedef ConfirmCallback = Function(Post post);
