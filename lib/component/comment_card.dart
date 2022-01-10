import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled6/constant.dart';
class CommentCard extends StatelessWidget {
  final width , height ,comment , userName;
  CommentCard({this.width, this.height,this.comment ,this.userName });
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(width: 10,),
            Container(
              child: Padding(
                padding:  EdgeInsets.only(top: width * 0.16),
                child: Center(
                  child: Text(
                    userName,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              height: height*0.12,
              width: width*0.12,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage('images/vector.jpg')
                  )
              ),
            ),
            SizedBox(width: 10),
            Padding(
              padding:  EdgeInsets.only(),
              child: Container(
                width: width * 0.8,
                height: height * 0.1,
                decoration: BoxDecoration(
                  color: kPrimaryColor.withOpacity(0.5),
                  borderRadius: BorderRadius.only(
                    // bottomLeft: Radius.circular(height / 3),
                    bottomRight: Radius.circular(height / 3),
                    topRight: Radius.circular(height / 3),
                    topLeft: Radius.circular(height / 3),
                  ),
                ),
                child: Center(
                  child: Text(
                    comment,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}