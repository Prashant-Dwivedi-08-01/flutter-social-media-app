// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class PostTags extends StatelessWidget {
  List<String>? tags;
  PostTags({Key? key, this.tags}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: tags!.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(2),
          child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Color(0xff66005a),
                borderRadius: BorderRadius.circular(10),
                shape: BoxShape.rectangle),
            child: Text(
              "#${tags![index]}",
              style: TextStyle(
                  fontSize: 16, color: Colors.white, fontFamily: 'Gilroy'),
            ),
          ),
        ),
      ),
    );
  }
}
