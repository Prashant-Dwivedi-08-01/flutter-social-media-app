// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:folder_structure/models/post_model.dart';

class PostTitle extends StatelessWidget {
  String? postTitle;
  PostTitle({Key? key, this.postTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          postTitle!,
          style: TextStyle(
            fontFamily: 'Gilroy',
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
