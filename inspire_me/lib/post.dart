import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Post extends StatelessWidget {
  /*String title='my post';
  int hour=4;
  int likes=43;
  int dislikes=2;
  List<String> comments=['très bien','merveilleux'];
  String url;
  String category='voyage';*/
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical:10.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding:  EdgeInsets.symmetric(horizontal:15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('title',style:TextStyle(fontSize:30.0)),
                  Column(
                    children: <Widget>[
                      Text('category',style:TextStyle(fontSize:20.0,color: Colors.grey)),
                      Text('hour.toString()',style:TextStyle(fontSize:20.0,color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            ),
            Image.asset('assets/post1.png', width: double.infinity,fit: BoxFit.cover),
            Padding(
              padding: EdgeInsets.symmetric(vertical:5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment : CrossAxisAlignment.end,
                children: <Widget>[
                  Row(
                    crossAxisAlignment : CrossAxisAlignment.end,
                    children: <Widget>[
                      SvgPicture.asset('icons/uparrow.svg',color: Colors.orange,),
                      Text('5K',style: TextStyle(color:Colors.orange))
                    ],
                  ),
                  Row(
                    crossAxisAlignment : CrossAxisAlignment.end,
                    children: <Widget>[
                      SvgPicture.asset('icons/downarrow.svg',color: Colors.red,),
                      Text('49',style: TextStyle(color:Colors.red))
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.comment,color: Colors.grey,),
                      Text('63',style: TextStyle(color:Colors.grey))
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.share,color: Colors.grey,),
                      Text('Share',style: TextStyle(color:Colors.grey))
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
    );
  }
}