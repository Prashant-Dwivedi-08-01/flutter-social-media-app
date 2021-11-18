// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:folder_structure/models/user_model.dart';
import 'package:folder_structure/services/api.dart';
import 'package:folder_structure/services/request_status.dart';
import 'package:folder_structure/services/user_prefrences.dart';
import 'package:folder_structure/utils/base_view_model.dart';
import 'package:folder_structure/utils/view_state_enum.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginViewModel extends BaseViewModel {
  final Api _api = Api();

  String? _email;
  String? _password;
  String? errorMessage;
  bool isLoggedIn = false;

  User? _currentUser;
  User? get currentUser => _currentUser;

  setEmail(String email) {
    _email = email;
  }

  setPassword(String password) {
    _password = password;
  }

  bool isEmailValid() {
    String emailExpression =
        r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?";
    if (!RegExp(emailExpression).hasMatch(_email!)) {
      return false;
    } else {
      return true;
    }
  }

  userLogin() async {
    setState(ViewState.Busy);

    if (_email != null && _password != null) {
      if (!isEmailValid()) {
        errorMessage = 'Email Invalid';
      } else {
        var res = await _api.login(_email!, _password!);

        if (res is Success) {
          _currentUser = res.response as User;
          UserPreferences().saveUser(_currentUser!);
          errorMessage = null;
          isLoggedIn = true;
        } else if (res is Failure) {
          errorMessage = res.errorResponse as String;
          print(
              'Error in userLogin Function: code: ${res.code} errorResponse: ${res.errorResponse}');
        }
      }
    } else {
      errorMessage = 'Email or Password cannot be empty';
    }

    setState(ViewState.Idle);
  }

  final _googleSignin = GoogleSignIn();

  Future<GoogleSignInAccount?> googleLogin(BuildContext context) async {
    GoogleSignInAccount? user = await _googleSignin.signIn();

    if (user != null) {
      User newGoogleUser = User(
          email: user.email,
          name: user.displayName,
          id: user.id,
          password: user.id);

      print('Current User from Google is : ${user.displayName}');
      _currentUser = newGoogleUser;
      UserPreferences().saveUser(_currentUser!);

      errorMessage = null;
      isLoggedIn = true;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Google Authentication Unsuccessful')));
    }
  }

  googleLogout() async {
    await _googleSignin.disconnect();
  }
}
