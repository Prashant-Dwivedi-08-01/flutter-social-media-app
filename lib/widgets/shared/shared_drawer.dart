// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:folder_structure/services/user_prefrences.dart';
import 'package:folder_structure/views/login/login_view_model.dart';
import 'package:provider/src/provider.dart';

class SharedDrawer extends StatelessWidget {
  String? username = 'No Name';
  SharedDrawer({Key? key, this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginViewModel loginViewModel = context.watch<LoginViewModel>();

    return Drawer(
      child: Container(
        color: Colors.deepPurpleAccent,
        child: ListView(
          children: [
            DrawerHeader(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  // flex: 3,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    child: Image.asset(
                      'assets/images/account.png',
                      width: 100,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Welcome, $username',
                  style: TextStyle(
                      fontSize: 22, fontFamily: 'Gilroy', color: Colors.white),
                )
              ],
            )),
            ListTile(
              leading: Icon(
                CupertinoIcons.person,
                color: Colors.white,
              ),
              title: Text(
                'Profile',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Gilroy'),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.settings,
                color: Colors.white,
              ),
              title: Text(
                'Settings',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Gilroy'),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.bell,
                color: Colors.white,
              ),
              title: Text(
                'Notifications',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Gilroy'),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.arrow_right_square_fill,
                color: Colors.white,
              ),
              title: InkWell(
                splashColor: Colors.blue,
                onTap: () async {
                  await UserPreferences().removeUser();
                  await UserPreferences().removeUserToken();
                  await loginViewModel.googleLogout();
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/', (route) => false);
                },
                child: Text(
                  'Logout',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Gilroy'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
