import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasel_app/presentation/Components/backicon.dart';
import 'package:wasel_app/presentation/Components/my_button.dart';
import 'package:wasel_app/presentation/Components/my_txtfield.dart';
import 'package:wasel_app/presentation/Components/whitebox.dart';
import 'package:wasel_app/presentation/screens/forgot_password_screen.dart';

import 'package:wasel_app/presentation/screens/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool? checkBoxValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                // Back button positioned at the top-left
                BackIcon(),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.1,
                    left: MediaQuery.of(context).size.width * 0.08,
                  ),
                  child: Text(
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
                          MyTxtfield(
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
                          MyTxtfield(
                            icon: Icons.remove_red_eye,
                            hintText: "Password",
                          ),
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, bottom: 10),
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
                                padding: EdgeInsets.only(right: 20, bottom: 10),
                                child: Text(
                                  "Remember Me",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width *
                                        0.15,
                                    bottom: 10),
                                child: RichText(
                                    text: TextSpan(
                                        text: "Forgot Password?",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xff56a3e7),
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Get.to(ForgotPasswordScreen());
                                          })),
                              ),
                            ],
                          ),
                          MyButton(
                              color: const Color(0xff1778f2),
                              text: "Log in",
                              width: MediaQuery.of(context).size.width * 0.85,
                              txtColor: Colors.white,
                              onPressed: () {}),
                          OrDivider(),
                          MyButton(
                              color: const Color(0xff1778f2),
                              text: "Log in with Facebook",
                              width: MediaQuery.of(context).size.width * 0.85,
                              txtColor: Colors.white,
                              icon:
                                  "lib/presentation/assets/icons/facebook1.png",
                              onPressed: () {}),
                          MyButton(
                              color: Color.fromARGB(255, 225, 224, 226),
                              text: "Log in with Google",
                              width: MediaQuery.of(context).size.width * 0.85,
                              txtColor: const Color.fromARGB(255, 0, 0, 0),
                              icon: "lib/presentation/assets/icons/google.png",
                              onPressed: () {}),
                          Padding(
                              padding: EdgeInsets.only(
                                bottom: 25,
                              ),
                              child: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                    text: "Don't have an account? ",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black),
                                  ),
                                  TextSpan(
                                      text: "Sign Up",
                                      style: TextStyle(
                                          color: Color(0xff1778f2),
                                          fontSize: 14),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Get.to(SignupScreen());
                                        })
                                ]),
                              ))
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
    );
  }
}

class OrDivider extends StatelessWidget {
  const OrDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Left Divider Line
        Expanded(
          child: Divider(
            thickness: 1.5, // Thickness of the line
            color: Colors.grey, // Color of the line
          ),
        ),
        // "Or With" Text
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "Or With",
            style: TextStyle(
              color: const Color.fromARGB(255, 37, 35, 35),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        // Right Divider Line
        Expanded(
          child: Divider(
            thickness: 1.5,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
