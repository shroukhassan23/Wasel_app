import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:wasel_app/Auth/user_services.dart';
import 'package:wasel_app/businessLogic/cubit/auth_cubit.dart';
import 'package:wasel_app/presentation/Components/backicon.dart';
import 'package:wasel_app/presentation/Components/my_button.dart';
import 'package:wasel_app/presentation/Components/my_txtfield.dart';
import 'package:wasel_app/presentation/Components/or_divider.dart';
import 'package:wasel_app/presentation/Components/whitebox.dart';
import 'package:wasel_app/presentation/constants.dart';
import 'package:wasel_app/presentation/screens/forgot_password_screen.dart';
import 'package:wasel_app/presentation/screens/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool checkBoxValue = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _passwordVisible = false;
  void rememberMe() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("key", checkBoxValue);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          showDialog(
            context: context,
            builder: (context) {
              return Center(
                child: Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.2,
                    decoration: BoxDecoration(color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.all(50),
                      child: CircularProgressIndicator(
                        color: blue,
                      ),
                    )),
              );
            },
          );
        } else if (state is Authenticated) {
          Navigator.of(context).pushNamed('login_screen');
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset:
            true, // Ensures the screen adjusts to the keyboard
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xff56a3e7),
                    Color.fromARGB(255, 163, 205, 242),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Stack(
                children: [
                  BackIcon(),
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.1,
                      left: MediaQuery.of(context).size.width * 0.08,
                    ),
                    child: const Text(
                      "back",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),

                  // Logo in the middle of the screen
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.01,
                      left: MediaQuery.of(context).size.width * 0.3,
                      right: MediaQuery.of(context).size.width * 0.2,
                    ),
                    child: Image.asset(
                      "lib/presentation/assets/images/logo2.png",
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.3,
                    ),
                  ),

                  // White container at the bottom of the screen
                  Positioned(
                    bottom: 0,
                    child: WhiteContainer(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.72,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Text(
                                "Welcome back",
                                style: TextStyle(
                                  fontSize: 32,
                                  color: Color(0xff2c6aa2),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: MediaQuery.of(context).size.width * 0.75,
                              ),
                              child: const Text(
                                "Email",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                            // Link emailController to the text field
                            MyTxtfield(
                              controller:
                                  emailController, // Connect the controller
                              icon: Icons.email_outlined,
                              hintText: "example@gmail.com",
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: MediaQuery.of(context).size.width * 0.65,
                              ),
                              child: const Text(
                                "Password",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                            // Link passwordController to the text field

                            MyTxtfield(
                              controller:
                                  passwordController, // Connect the controller
                              icon: _passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              obsecuretext: _passwordVisible,
                              onpress: () {
                                setState(
                                  () {
                                    _passwordVisible = !_passwordVisible;
                                  },
                                );
                              },
                              hintText: "Password",
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, bottom: 10),
                                  child: Checkbox(
                                    value: checkBoxValue,
                                    onChanged: (bool? newValue) {
                                      setState(() {
                                        checkBoxValue = newValue ?? false;
                                      });
                                    },
                                    activeColor: Color(0xff2c6aa2),
                                    side: BorderSide(
                                      width: 2,
                                      color: Color.fromARGB(255, 164, 163, 165),
                                    ),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 20, bottom: 10),
                                  child: const Text(
                                    "Remember Me",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width *
                                        0.12,
                                    bottom: MediaQuery.of(context).size.width *
                                        0.02,
                                  ),
                                  child: RichText(
                                      text: TextSpan(
                                          text: "Forgot Password?",
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: Color(0xff56a3e7),
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              Navigator.of(context).pushNamed(
                                                  'forgot_password_screen');
                                            })),
                                ),
                              ],
                            ),
                            MyButton(
                                color: const Color(0xff1778f2),
                                text: "Log in",
                                width: MediaQuery.of(context).size.width * 0.85,
                                txtColor: Colors.white,
                                onPressed: () {
                                  context.read<AuthCubit>().signIn(
                                      emailController.text,
                                      passwordController.text);
                                  if (checkBoxValue == true) {
                                    rememberMe();
                                  }
                                  Navigator.of(context)
                                      .pushNamed('intro_screen');
                                }),
                            OrDivider(),
                            MyButton(
                                color: const Color(0xff1778f2),
                                text: "Log in with Facebook",
                                width: MediaQuery.of(context).size.width * 0.85,
                                txtColor: Colors.white,
                                icon:
                                    "lib/presentation/assets/icons/facebook1.png",
                                onPressed: () {
                                  context
                                      .read<AuthCubit>()
                                      .signInWithFacebook();
                                }),
                            MyButton(
                                color: Color.fromARGB(255, 225, 224, 226),
                                text: "Log in with Google",
                                width: MediaQuery.of(context).size.width * 0.85,
                                txtColor: const Color.fromARGB(255, 0, 0, 0),
                                icon:
                                    "lib/presentation/assets/icons/google.png",
                                onPressed: () {
                                  context
                                      .read<AuthCubit>()
                                      .signInUserWithGoogle();
                                }),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 25),
                              child: RichText(
                                text: TextSpan(children: [
                                  const TextSpan(
                                    text: "Don't have an account? ",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black),
                                  ),
                                  TextSpan(
                                      text: "Sign Up",
                                      style: const TextStyle(
                                          color: Color(0xff1778f2),
                                          fontSize: 14),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.of(context)
                                              .pushNamed('signup_screen');
                                        })
                                ]),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
