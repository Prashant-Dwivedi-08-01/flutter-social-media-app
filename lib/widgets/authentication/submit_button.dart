// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:folder_structure/models/user_model.dart';
import 'package:folder_structure/services/user_prefrences.dart';

class SubmitButton extends StatelessWidget {
  Object? title;
  String? nextScreen;
  dynamic model;
  Function? submitAction = () {};

  SubmitButton(
      {Key? key, this.title, this.submitAction, this.nextScreen, this.model})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (submitAction != null) {
          await submitAction!();
          User user = await UserPreferences().getUser();
          if (user.id != null) {
            Navigator.popAndPushNamed(context, nextScreen!);
          }
        }
      },
      child: Container(
        width: 340,
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.deepPurpleAccent, Colors.purple])),
        child: title is String
            ? Text(
                title! as String,
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )
            : title as Widget,
      ),
    );
  }
}
