// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostLikes extends StatelessWidget {
  int? numberOfLikes;
  PostLikes({Key? key, this.numberOfLikes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(CupertinoIcons.hand_thumbsup_fill),
                iconSize: 35,
                color: Colors.deepPurpleAccent),
            Text(
              'Total Likes, $numberOfLikes',
              style: TextStyle(fontSize: 18, fontFamily: 'Gilroy'),
            ),
          ],
        )
      ],
    );
  }
}
