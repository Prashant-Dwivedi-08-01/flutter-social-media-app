// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:folder_structure/models/post_model.dart';
import 'package:folder_structure/views/home/home_view.dart';
import 'package:folder_structure/views/home/home_view_model.dart';
import 'package:folder_structure/views/post/post_view_model.dart';
import 'package:provider/provider.dart';

class HotDestinations extends StatelessWidget {
  HomeViewModel? homeModel;
  HotDestinations({this.homeModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: (ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          Post post = homeModel!.postList[index];
          return Consumer<PostViewModel>(
            builder: (context, model, child) => Card(
              shadowColor: Colors.white,
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(35.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Hero(
                    tag: 'post-image-${post.id}',
                    child: CachedNetworkImage(
                      progressIndicatorBuilder: (context, url, progress) =>
                          Center(
                        child: CircularProgressIndicator(
                          value: progress.progress,
                        ),
                      ),
                      imageUrl:
                          'https://images.unsplash.com/photo-1587135941948-670b381f08ce?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1170&q=80',
                      imageBuilder: (context, imageProvider) => Container(
                        width: 320.0,
                        height: 180.0,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          image: DecorationImage(
                              fit: BoxFit.cover, image: imageProvider),
                          borderRadius: BorderRadius.all(Radius.circular(16.0)),
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        PostViewModel model = context.read<PostViewModel>();
                        await model.setThisPost(post);
                        Navigator.pushNamed(context, '/post', arguments: post);
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.deepPurpleAccent),
                      child: Text(
                        post.title!,
                        style: TextStyle(fontFamily: 'Gilroy', fontSize: 20),
                      )),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => Divider(),
        itemCount: homeModel!.postList.length,
      )),
    );
  }
}
