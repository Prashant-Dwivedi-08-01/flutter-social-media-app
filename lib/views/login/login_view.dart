// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:folder_structure/utils/view_state_enum.dart';
import 'package:folder_structure/views/login/login_view_model.dart';
import 'package:folder_structure/widgets/authentication/bezier_container.dart';
import 'package:folder_structure/widgets/authentication/divider.dart';
import 'package:folder_structure/widgets/authentication/entry_field.dart';
import 'package:folder_structure/widgets/authentication/google_login.dart';
import 'package:folder_structure/widgets/authentication/submit_button.dart';
import 'package:folder_structure/widgets/authentication/toggle_authentication.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    LoginViewModel loginViewModel = context.watch<LoginViewModel>();
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: BezierContainer(),
            top: -height * .15,
            right: -MediaQuery.of(context).size.width * .4,
          ),
          Positioned(
              top: 190,
              left: 10,
              right: 0,
              bottom: 0,
              child: SingleChildScrollView(
                child: Consumer<LoginViewModel>(
                  builder: (context, model, child) => Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 30,
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
                        model.errorMessage == null
                            ? SizedBox(height: 25)
                            : SizedBox(
                                height: 25,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      model.errorMessage!,
                                      style: TextStyle(color: Colors.red),
                                    )
                                  ],
                                ),
                              ),
                        SizedBox(
                          height: 10,
                        ),
                        model.state == ViewState.Busy
                            ? SubmitButton(
                                title: Transform.scale(
                                  scale: 0.5,
                                  child: SizedBox(
                                    height: 25,
                                    child: SpinKitThreeInOut(
                                      size: 50,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                            : SubmitButton(
                                title: 'Login',
                                model: loginViewModel,
                                nextScreen: '/home',
                                submitAction: model.userLogin,
                              ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: 340,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Text('Forget password?'),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        CustomAuthDivider(),
                        SizedBox(
                          height: 20,
                        ),
                        GoogleLogin(
                          submitAction: model.googleLogin,
                          nextScreen: '/home',
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        ToggleAuthentication(
                          message: 'Dont have an account?',
                          functionality: 'Register',
                        ),
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
