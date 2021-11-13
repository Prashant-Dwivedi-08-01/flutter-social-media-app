// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';

class GoogleLogin extends StatelessWidget {
  const GoogleLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(primary: Colors.grey.shade500),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/google_image.png',
              width: 25,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Login With Google',
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
