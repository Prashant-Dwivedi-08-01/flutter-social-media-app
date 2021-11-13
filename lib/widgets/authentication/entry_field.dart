// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class EntryField extends StatelessWidget {
  String? title;
  Function? setValue = () {};
  bool hideText = false;

  EntryField({Key? key, this.title, this.setValue, required this.hideText})
      : super(key: key);

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
            obscureText: hideText,
            onChanged: (String value) {
              if (setValue != null) {
                setValue!(value);
              }
            },
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
