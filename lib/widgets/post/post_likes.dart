// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:folder_structure/models/post_model.dart';
import 'package:folder_structure/models/user_model.dart';
import 'package:folder_structure/services/user_prefrences.dart';
import 'package:folder_structure/views/post/post_view_model.dart';

class PostLikes extends StatelessWidget {
  PostViewModel? model;
  int? numberOfLikes;
  String? postId;
  Function? likeThisPost;
  PostLikes({
    Key? key,
    this.model,
    this.numberOfLikes,
    this.likeThisPost,
    this.postId,
  }) : super(key: key);

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
                    await likeThisPost!(postId); //homeViewModel
                    await model!.getThisPost(postId!); //postViewModel
                  }
                },
                icon: model!.hasLiked == true
                    ? Icon(CupertinoIcons.hand_thumbsup_fill)
                    : Icon(CupertinoIcons.hand_thumbsup),
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
