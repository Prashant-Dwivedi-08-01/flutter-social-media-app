// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:folder_structure/models/post_model.dart';
import 'package:folder_structure/utils/view_state_enum.dart';
import 'package:folder_structure/views/home/home_view_model.dart';
import 'package:folder_structure/views/post/post_view_model.dart';
import 'package:folder_structure/views/profile/profile_view_model.dart';
import 'package:folder_structure/widgets/post/post_comment_field.dart';
import 'package:folder_structure/widgets/post/post_comments_list.dart';
import 'package:folder_structure/widgets/post/post_creator.dart';
import 'package:folder_structure/widgets/post/post_image.dart';
import 'package:folder_structure/widgets/post/post_likes.dart';
import 'package:folder_structure/widgets/post/post_message.dart';
import 'package:folder_structure/widgets/post/post_tags.dart';
import 'package:folder_structure/widgets/post/post_title.dart';
import 'package:folder_structure/widgets/shared/shared_drawer.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PostView extends StatelessWidget {
  final Post? post;

  PostView({this.post});

  @override
  Widget build(BuildContext context) {
    HomeViewModel homeModel = context.read<HomeViewModel>();
    PostViewModel postModel = context.read<PostViewModel>();
    return Scaffold(
      drawer: SharedDrawer(),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(
          2.0,
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.deepPurpleAccent, fixedSize: Size(150, 25)),
            onPressed: () {
              homeModel.addThisPostToBucketList(postModel.currentPost!.id!);
            },
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
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.notification_add),
          )
        ],
        title: Text("Memories"),
        backgroundColor: Colors.deepPurpleAccent, //Color(0xff66005a)
      ),
      body: Consumer<PostViewModel>(
        builder: (context, postViewModel, child) => SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PostImage(
                postId: postViewModel.currentPost!.id,
              ),
              SizedBox(
                height: 10,
              ),
              PostTitle(
                postTitle: postViewModel.currentPost!.title!,
              ),
              PostCreator(
                name: postViewModel.currentPost!.name,
              ),
              SizedBox(
                height: 10,
              ),
              PostMessage(
                message: postViewModel.currentPost!.message,
              ),
              PostTags(
                tags: postViewModel.currentPost!.tags,
              ),
              Consumer<HomeViewModel>(builder: (context, homeViewModel, child) {
                return homeViewModel.state == ViewState.Busy ||
                        postViewModel.state == ViewState.Busy
                    ? SpinKitThreeInOut(
                        size: 50,
                        color: Colors.deepPurpleAccent,
                      )
                    : PostLikes(
                        model: postViewModel,
                        numberOfLikes: postViewModel.currentPost!.likes!.length,
                        likeThisPost: homeViewModel.likeThisPost,
                        postId: postViewModel.currentPost!.id);
              }),
              SizedBox(
                height: 20,
              ),
              Consumer<HomeViewModel>(
                builder: (context, homeViewModel, child) {
                  return PostCommentField(
                      model: postViewModel,
                      commentOnThisPost: homeViewModel.commentOnThisPost,
                      postId: postViewModel.currentPost!.id);
                },
              ),
              SizedBox(
                height: 10,
              ),
              Consumer<PostViewModel>(
                builder: (context, postViewModel, child) {
                  return PostCommentList(
                    comments: postViewModel.currentPost!.comments,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
