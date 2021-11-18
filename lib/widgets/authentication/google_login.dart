// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:folder_structure/models/user_model.dart';
import 'package:folder_structure/services/user_prefrences.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleLogin extends StatelessWidget {
  Function? submitAction = () {};
  String? nextScreen;
  GoogleLogin({Key? key, this.submitAction, this.nextScreen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340,
      child: ElevatedButton(
        onPressed: () async {
          await submitAction!(context);
          User user = await UserPreferences().getUser();
          if (user.id != null) {
            Navigator.popAndPushNamed(context, nextScreen!);
          }
        },
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
