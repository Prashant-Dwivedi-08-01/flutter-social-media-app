// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PostImage extends StatelessWidget {
  String? postId;
  PostImage({Key? key, this.postId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'post-image-$postId',
      child: CachedNetworkImage(
        progressIndicatorBuilder: (context, url, progress) => Center(
          child: SpinKitThreeInOut(
            size: 50,
            color: Colors.deepPurpleAccent,
          ),
        ),
        imageUrl:
            'https://images.unsplash.com/photo-1587135941948-670b381f08ce?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1170&q=80',
        imageBuilder: (context, imageProvider) => Container(
          width: 400.0,
          height: 400.0,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
            image: DecorationImage(fit: BoxFit.cover, image: imageProvider),
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
            color: Colors.redAccent,
          ),
        ),
      ),
    );
  }
}
