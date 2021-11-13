// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:folder_structure/widgets/authentication/bezier_container.dart';
import 'package:folder_structure/widgets/authentication/divider.dart';
import 'package:folder_structure/widgets/authentication/entry_field.dart';
import 'package:folder_structure/widgets/authentication/google_login.dart';
import 'package:folder_structure/widgets/authentication/submit_button.dart';
import 'package:folder_structure/widgets/authentication/toggle_authentication.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: BezierContainer(),
            top: -height * .15,
            right: -MediaQuery.of(context).size.width * .4,
          ),
          Positioned(
              top: 240,
              left: 10,
              right: 0,
              bottom: 0,
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      EntryField(
                        title: 'First Name',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      EntryField(
                        title: 'Last Name',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      EntryField(
                        title: 'Email',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      EntryField(
                        title: 'Password',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      EntryField(
                        title: 'Confirm Password',
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      SubmitButton(
                        title: 'Register',
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      CustomAuthDivider(),
                      SizedBox(
                        height: 20,
                      ),
                      GoogleLogin(),
                      SizedBox(
                        height: 50,
                      ),
                      ToggleAuthentication(
                        message: 'Already have an account?',
                        functionality: 'Login',
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
