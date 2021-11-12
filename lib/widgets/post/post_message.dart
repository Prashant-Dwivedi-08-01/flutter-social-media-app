import 'package:flutter/material.dart';

class PostMessage extends StatelessWidget {
  String? message;
  PostMessage({Key? key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          message!,
          style: TextStyle(fontSize: 20, fontFamily: 'Gilroy'),
        )
      ],
    );
  }
}
