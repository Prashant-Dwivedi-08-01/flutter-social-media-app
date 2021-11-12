// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class PostCommentField extends StatelessWidget {
  const PostCommentField({Key? key}) : super(key: key);

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
                decoration: InputDecoration(hintText: 'Your Comment..'),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.deepPurpleAccent),
              onPressed: () {},
              child: Text('Comment',
                  style: TextStyle(
                    fontFamily: 'Gilroy',
                    fontSize: 15,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.w700,
                  )),
            )
          ],
        )
      ],
    );
  }
}
