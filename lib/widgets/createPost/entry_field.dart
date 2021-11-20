// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CreatePostEntryField extends StatelessWidget {
  String? hintText;
  TextEditingController? controller;

  CreatePostEntryField({Key? key, this.controller, this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) return "${hintText!} can't be empty";
      },
      decoration: InputDecoration(
        hintText: hintText!,
      ),
    );
  }
}
