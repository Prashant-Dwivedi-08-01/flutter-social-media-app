// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class CustomAuthDivider extends StatelessWidget {
  const CustomAuthDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340,
      child: Row(
        children: [
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Divider(
              thickness: 2,
            ),
          ),
          Text('or'),
          Expanded(
            child: Divider(
              thickness: 2,
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
}
