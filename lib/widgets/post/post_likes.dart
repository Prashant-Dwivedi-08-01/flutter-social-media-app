// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostLikes extends StatelessWidget {
  int? numberOfLikes;
  String? postId;
  Function? likeThisPost;
  Function? getThisPost;
  PostLikes(
      {Key? key,
      this.numberOfLikes,
      this.likeThisPost,
      this.postId,
      this.getThisPost})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            IconButton(
                onPressed: () async {
                  if (likeThisPost != null) {
                    await likeThisPost!(postId);
                    if (getThisPost != null) {
                      await getThisPost!(postId);
                    }
                  }
                },
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
