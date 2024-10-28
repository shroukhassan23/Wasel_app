import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:wasel_app/presentation/Components/backicon.dart';
import 'package:wasel_app/presentation/Components/my_button.dart';
import 'package:wasel_app/presentation/Components/my_txtfield.dart';
import 'package:wasel_app/presentation/Components/whitebox.dart';
import 'package:wasel_app/presentation/constants.dart';
import 'package:wasel_app/presentation/screens/signup_screen.dart';

class CreatePassScreen extends StatelessWidget {
  const CreatePassScreen({super.key});

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
                    style: const TextStyle(
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
                      // Wrap Column with SingleChildScrollView
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.05,
                            ),
                            child: Text(
                              "Create New Password",
                              style: TextStyle(
                                fontSize: 32,
                                color: blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                right:
                                    MediaQuery.of(context).size.height * 0.02,
                                left: MediaQuery.of(context).size.height * 0.02,
                              ),
                              child: Text(
                                "Please enter and confirm your new password ",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xffcac9cb),
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                          Text(
                            "You will need to login after you reset",
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xffcac9cb),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.05,
                              right: MediaQuery.of(context).size.width * 0.75,
                            ),
                            child: const Text(
                              "Password",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          MyTxtfield(
                            icon: Icons.email_outlined,
                            hintText: "Enter your password",
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.02,
                              right: MediaQuery.of(context).size.width * 0.6,
                            ),
                            child: const Text(
                              "Confirm Password",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          MyTxtfield(
                            icon: Icons.email_outlined,
                            hintText: "Enter your password",
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.02,
                            ),
                            child: MyButton(
                                color: const Color(0xff1778f2),
                                text: "Reset Password",
                                width: MediaQuery.of(context).size.width * 0.85,
                                txtColor: Colors.white,
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushNamed('create_password_screen');
                                }),
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
    );
  }
}
