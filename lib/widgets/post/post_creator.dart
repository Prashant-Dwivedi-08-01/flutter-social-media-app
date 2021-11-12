// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class PostCreator extends StatelessWidget {
  String? name;
  PostCreator({Key? key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'By, ${name!}',
          style: TextStyle(
            fontSize: 18,
            fontStyle: FontStyle.italic,
          ),
        )
      ],
    );
  }
}
