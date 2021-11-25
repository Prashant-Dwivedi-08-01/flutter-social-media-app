// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ToggleAuthentication extends StatelessWidget {
  String? message;
  String? functionality;
  ToggleAuthentication({Key? key, this.message, this.functionality})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message!,
            style: TextStyle(fontFamily: 'Gilroy', fontWeight: FontWeight.bold),
          ),
          TextButton(
            onPressed: () {
              Navigator.popAndPushNamed(
                  context, '/${functionality!.toLowerCase()}');
            },
            child: Text(
              functionality!,
              style: TextStyle(
                  color: Colors.deepPurpleAccent,
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
