// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:folder_structure/models/user_model.dart';
import 'package:folder_structure/services/user_prefrences.dart';
import 'package:folder_structure/views/createPost/createpost_view.dart';
import 'package:folder_structure/views/home/home_view.dart';
import 'package:folder_structure/views/login/login_view.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<User> userData() => UserPreferences().getUser();

    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: FutureBuilder(
        future: userData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(
                child: Text("Something Went Wrong"),
              );
            } else {
              User user = snapshot.data as User;
              if (user.id == null) {
                return LoginView();
              } else {
                return HomeView();
              }
            }
          } else {
            return CircularProgressIndicator(
              color: Colors.white,
            );
          }
        },
      ),
    );
  }
}
