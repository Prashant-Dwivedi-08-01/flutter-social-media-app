// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:folder_structure/models/post_model.dart';
import 'package:folder_structure/views/home/home_view.dart';
import 'package:folder_structure/views/post/post_view.dart';

class Navigation {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    final post = settings.arguments as Post;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeView());
      case '/post':
        return MaterialPageRoute(builder: (context) => PostView(post: post));
      default:
        return MaterialPageRoute(
            builder: (_) => const Center(
                  child: Text("No such route"),
                ));
    }
  }
}
