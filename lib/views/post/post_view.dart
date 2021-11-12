// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:folder_structure/models/post_model.dart';
import 'package:folder_structure/widgets/post/post_comment_field.dart';
import 'package:folder_structure/widgets/post/post_comments_list.dart';
import 'package:folder_structure/widgets/post/post_creator.dart';
import 'package:folder_structure/widgets/post/post_image.dart';
import 'package:folder_structure/widgets/post/post_likes.dart';
import 'package:folder_structure/widgets/post/post_message.dart';
import 'package:folder_structure/widgets/post/post_tags.dart';
import 'package:folder_structure/widgets/post/post_title.dart';

class PostView extends StatelessWidget {
  final Post? post;

  PostView({this.post});

  @override
  Widget build(BuildContext context) {
    /*
      When someone like the post, then we will run the concerned function from
      post_view_model and thus there notifyListerns() will be called and this view will be rebuild
    */

    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(
          2.0,
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.deepPurpleAccent, fixedSize: Size(150, 25)),
            onPressed: () {},
            child: Text('Add to Bucketlist',
                style: TextStyle(
                  fontFamily: 'Gilroy',
                  fontSize: 18,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.w700,
                )),
          ),
        ),
      ),
      backgroundColor: Color(0xffededed),
      appBar: AppBar(
        leading: Icon(CupertinoIcons.person_alt),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.notification_add),
          )
        ],
        title: Text("Memories"),
        backgroundColor: Colors.deepPurpleAccent, //Color(0xff66005a)
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PostImage(
              postId: post!.id,
            ),
            SizedBox(
              height: 10,
            ),
            PostTitle(
              postTitle: post!.title,
            ),
            PostCreator(
              name: post!.name,
            ),
            SizedBox(
              height: 10,
            ),
            PostMessage(
              message: post!.message,
            ),
            PostTags(
              tags: post!.tags,
            ),
            PostLikes(
              numberOfLikes: post!.likes!.length,
            ),
            SizedBox(
              height: 20,
            ),
            PostCommentField(),
            SizedBox(
              height: 10,
            ),
            PostCommentList(
              comments: post!.comments,
            ),
          ],
        ),
      ),
    );
  }
}
