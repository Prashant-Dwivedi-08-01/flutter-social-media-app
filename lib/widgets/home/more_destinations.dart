// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:folder_structure/models/post_model.dart';
import 'package:folder_structure/views/home/home_view_model.dart';

class MoreDestinations extends StatelessWidget {
  HomeViewModel? homeModel;
  MoreDestinations({Key? key, this.homeModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (context, index) => Divider(),
        itemCount: homeModel!.postList.length,
        itemBuilder: (context, index) {
          Post post = homeModel!.postList[index];
          return Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.deepPurpleAccent.shade100),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedNetworkImage(
                  progressIndicatorBuilder: (context, url, progress) => Center(
                    child: CircularProgressIndicator(
                      value: progress.progress,
                    ),
                  ),
                  imageUrl:
                      'https://images.unsplash.com/photo-1610878180933-123728745d22?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1074&q=80',
                  imageBuilder: (context, imageProvider) => Container(
                    width: 150.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      image: DecorationImage(
                          fit: BoxFit.cover, image: imageProvider),
                      borderRadius: BorderRadius.all(Radius.circular(16.0)),
                      color: Colors.redAccent,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post.title!,
                        style: TextStyle(
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      Text(
                        post.message!,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(fontFamily: 'Gilroy', fontSize: 18),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
