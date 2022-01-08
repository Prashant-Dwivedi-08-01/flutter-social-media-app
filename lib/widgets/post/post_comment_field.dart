// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:folder_structure/utils/view_state_enum.dart';
import 'package:folder_structure/views/post/post_view.dart';
import 'package:folder_structure/views/post/post_view_model.dart';
import 'package:provider/provider.dart';

class PostCommentField extends StatelessWidget {
  TextEditingController comment = TextEditingController();
  PostViewModel? model;
  Function? commentOnThisPost;
  String? postId;

  PostCommentField({Key? key, this.commentOnThisPost, this.postId, this.model})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Comments',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Gilroy'),
            )
          ],
        ),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: comment,
                decoration: InputDecoration(hintText: 'Your Comment..'),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.deepPurpleAccent),
              onPressed: () async {
                print(comment.text);
                if (commentOnThisPost != null) {
                  await commentOnThisPost!(postId, comment.text); //home
                  await model!.getThisPost(postId!); //postviewmodel
                }
              },
              child: Consumer<PostViewModel>(
                builder: (context, postViewModel, child) {
                  return postViewModel.state == ViewState.Busy
                      ? SpinKitThreeInOut(
                          size: 20,
                          color: Colors.white,
                        )
                      : Text('Comment',
                          style: TextStyle(
                            fontFamily: 'Gilroy',
                            fontSize: 15,
                            letterSpacing: 1.5,
                            fontWeight: FontWeight.w700,
                          ));
                },
              ),
            )
          ],
        )
      ],
    );
  }
}
