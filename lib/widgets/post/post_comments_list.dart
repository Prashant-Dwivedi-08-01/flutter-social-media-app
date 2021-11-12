// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostCommentList extends StatelessWidget {
  List<String>? comments;
  PostCommentList({Key? key, this.comments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: comments!.length,
            itemBuilder: (context, index) => Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                        child: Icon(
                      CupertinoIcons.person,
                    )),
                    SizedBox(
                      width: 5,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          comments![index]
                              .substring(0, comments![index].indexOf(':')),
                          style: TextStyle(
                              fontFamily: 'Gilroy',
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(comments![index]
                            .substring(comments![index].indexOf(':') + 1)),
                        Divider(
                          height: 20,
                        )
                      ],
                    ),
                  ],
                ))
      ],
    );
  }
}
