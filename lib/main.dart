// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:folder_structure/utils/navigation.dart';
import 'package:folder_structure/views/home/home_view.dart';
import 'package:folder_structure/views/home/home_view_model.dart';
import 'package:folder_structure/views/login/login_view.dart';
import 'package:folder_structure/views/login/login_view_model.dart';
import 'package:folder_structure/views/post/post_view_model.dart';
import 'package:folder_structure/views/register/register_view_model.dart';
import 'package:folder_structure/views/welcome_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ChangeNotifierProvider(create: (_) => PostViewModel()),
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => RegisterViewModel())
      ],
      child: MaterialApp(
        title: "Memories",
        debugShowCheckedModeBanner: false,
        home: WelcomeView(),
        onGenerateRoute: Navigation.generateRoutes,
      ),
    );
  }
}
