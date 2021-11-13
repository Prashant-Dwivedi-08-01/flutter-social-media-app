// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Actions',
          style: TextStyle(
              fontFamily: 'Gilroy', fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 60,
              width: 60,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(18.0)),
              child: Icon(
                CupertinoIcons.heart_fill,
                color: Colors.red,
                size: 40,
              ),
            ),
            Container(
              height: 60,
              width: 60,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(18.0)),
              child: Icon(
                CupertinoIcons.envelope,
                color: Colors.indigoAccent,
                size: 40,
              ),
            ),
            Container(
              height: 60,
              width: 60,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(18.0)),
              child: Icon(
                CupertinoIcons.alarm_fill,
                color: Colors.orange,
                size: 40,
              ),
            ),
            Container(
              height: 60,
              width: 60,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(18.0)),
              child: Icon(
                CupertinoIcons.arrow_clockwise_circle_fill,
                color: Colors.green,
                size: 40,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
