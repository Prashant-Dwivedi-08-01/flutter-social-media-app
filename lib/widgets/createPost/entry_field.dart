// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class CreatePostEntryField extends StatelessWidget {
  String? hintText;
  int? maxLines;
  TextEditingController? controller;

  CreatePostEntryField(
      {Key? key, this.controller, this.hintText, this.maxLines = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines!,
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) return "${hintText!} can't be empty";
      },
      decoration: InputDecoration(
        hintText: hintText!,
        hintStyle: TextStyle(
            color: Colors.white,
            fontFamily: 'Gilroy',
            fontSize: 15,
            fontWeight: FontWeight.bold),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 1.0),
            borderRadius: BorderRadius.circular(5)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 1.0),
            borderRadius: BorderRadius.circular(5)),
      ),
    );
  }
}
