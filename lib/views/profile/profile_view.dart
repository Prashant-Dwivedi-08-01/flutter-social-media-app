// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:folder_structure/utils/view_state_enum.dart';
import 'package:folder_structure/views/profile/profile_view_model.dart';
import 'package:folder_structure/widgets/profile/list_of_posts.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatelessWidget {
  String? username = "";
  String? email = "";
  String? userId;
  ProfileView({Key? key, this.email, this.username, this.userId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.purple, Colors.deepPurpleAccent])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 80,
                ),
                SizedBox(
                  height: 210,
                  child: Stack(
                    children: [
                      Positioned(
                          top: 40,
                          left: 28,
                          child: Container(
                            width: 320,
                            height: 150,
                            decoration: BoxDecoration(
                                color: Color(0xff692975),
                                borderRadius: BorderRadius.circular(20)),
                          )),
                      Positioned(
                        top: 0,
                        left: 140,
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.white,
                          child: Image.asset(
                            'assets/images/account.png',
                            width: 100,
                          ),
                        ),
                      ),
                      Positioned(
                          top: 120,
                          left: 110,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                username!,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Gilroy',
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                email!,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Gilroy',
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),

                // POSTS FROM USER
                Text('Your Memories',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
                SizedBox(
                  height: 20,
                ),
                Consumer<ProfileViewModel>(
                  builder: (context, profileModel, child) =>
                      profileModel.state == ViewState.Busy
                          ? CircularProgressIndicator()
                          : ListOfPosts(
                              profileModel: profileModel,
                            ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
