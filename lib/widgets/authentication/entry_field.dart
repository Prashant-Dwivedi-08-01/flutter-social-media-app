// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class EntryField extends StatelessWidget {
  String? title;
  EntryField({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title!,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Gilroy',
                fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            obscureText: false,
            decoration: InputDecoration(
              border: InputBorder.none,
              fillColor: Colors.grey.shade200, //Color(0xfff3f3f4)
              filled: true,
            ),
          ),
        ],
      ),
    );
  }
}
