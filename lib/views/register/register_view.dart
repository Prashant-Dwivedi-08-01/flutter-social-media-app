// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:folder_structure/utils/view_state_enum.dart';
import 'package:folder_structure/views/login/login_view_model.dart';
import 'package:folder_structure/views/register/register_view_model.dart';
import 'package:folder_structure/widgets/authentication/bezier_container.dart';
import 'package:folder_structure/widgets/authentication/divider.dart';
import 'package:folder_structure/widgets/authentication/entry_field.dart';
import 'package:folder_structure/widgets/authentication/google_login.dart';
import 'package:folder_structure/widgets/authentication/submit_button.dart';
import 'package:folder_structure/widgets/authentication/toggle_authentication.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    LoginViewModel loginViewModel = context.watch<LoginViewModel>();
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: BezierContainer(),
            top: -height * .15,
            right: -MediaQuery.of(context).size.width * .4,
          ),
          Positioned(
              top: 240,
              left: 10,
              right: 0,
              bottom: 0,
              child: SingleChildScrollView(
                child: Consumer<RegisterViewModel>(
                  builder: (context, model, child) => Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        EntryField(
                          title: 'First Name',
                          setValue: model.setFirstName,
                          hideText: false,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        EntryField(
                          title: 'Last Name',
                          setValue: model.setLastName,
                          hideText: false,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        EntryField(
                          title: 'Email',
                          setValue: model.setEmail,
                          hideText: false,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        EntryField(
                          title: 'Password',
                          setValue: model.setPassword,
                          hideText: true,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        EntryField(
                          title: 'Confirm Password',
                          setValue: model.setConfirmPassword,
                          hideText: false,
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        model.state == ViewState.Busy
                            ? SubmitButton(
                                title: Transform.scale(
                                  scale: 0.5,
                                  child: SizedBox(
                                    height: 25,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                            : SubmitButton(
                                title: 'Register',
                                model: model,
                                nextScreen: '/home',
                                submitAction: model.userRegister,
                              ),
                        SizedBox(
                          height: 25,
                        ),
                        CustomAuthDivider(),
                        SizedBox(
                          height: 20,
                        ),
                        GoogleLogin(
                          submitAction: loginViewModel.googleLogin,
                          nextScreen: '/home',
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        ToggleAuthentication(
                          message: 'Already have an account?',
                          functionality: 'Login',
                        ),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
