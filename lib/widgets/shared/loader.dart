// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomLoader extends StatelessWidget {
  double? size = 25;
  CustomLoader({Key? key, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpinKitThreeInOut(
      size: size!,
      color: Colors.white,
    );
  }
}
