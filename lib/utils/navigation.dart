// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:folder_structure/models/post_model.dart';
import 'package:folder_structure/views/createPost/createpost_view.dart';
import 'package:folder_structure/views/home/home_view.dart';
import 'package:folder_structure/views/login/login_view.dart';
import 'package:folder_structure/views/post/post_view.dart';
import 'package:folder_structure/views/register/register_view.dart';
import 'package:folder_structure/views/welcome_view.dart';

class Navigation {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => WelcomeView());
      case '/home':
        return MaterialPageRoute(builder: (_) => HomeView());
      case '/post':
        final post = settings.arguments as Post;
        return MaterialPageRoute(builder: (context) => PostView(post: post));
      case '/login':
        return MaterialPageRoute(builder: (context) => LoginView());
      case '/register':
        return MaterialPageRoute(builder: (context) => RegisterView());
      case '/createPost':
        return MaterialPageRoute(builder: (_) => CreatePostView());
      default:
        return MaterialPageRoute(
            builder: (_) => const Center(
                  child: Text("No such route"),
                ));
    }
  }
}
