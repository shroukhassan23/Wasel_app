import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasel_app/businessLogic/cubit/auth_cubit.dart';

import 'package:wasel_app/presentation/Components/backicon.dart';
import 'package:wasel_app/presentation/Components/backtxt.dart';
import 'package:wasel_app/presentation/Components/my_button.dart';
import 'package:wasel_app/presentation/Components/my_txtfield.dart';
import 'package:wasel_app/presentation/Components/whitebox.dart';
import 'package:wasel_app/presentation/constants.dart';
import 'package:wasel_app/presentation/screens/verification_screen.dart';
import 'package:wasel_app/themeing/mycolors.dart';

class ForgotPasswordScreen extends StatefulWidget {
  ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
        } else if (state is AuthError) {
          Navigator.of(context).pop(); // Close the loading dialog
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        } else if (state is AuthPasswordResetEmailSent) {
          Navigator.of(context)
              .pushNamed('verification_screen'); // Close the loading dialog
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Password reset email sent!')),
          );
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
              child: Stack(
                children: [
                  // Back button positioned at the top-left
                  BackIcon(),
                  Backtxt(),
                  // Logo
                  Positioned(
                    top: -30,
                    right: MediaQuery.of(context).size.width * 0.25,
                    child: Image.asset(
                      "lib/presentation/assets/images/logo1.png",
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.3,
                    ),
                  ),
                  Positioned(
                    top: -150,
                    right: -100,
                    child: Container(
                      width: 350,
                      height: 350,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                          colors: [
                            Colors.purple.withOpacity(0.1),
                            Colors.transparent,
                          ],
                          stops: [0.3, 1.0],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 100,
                    left: -100,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 500,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                          colors: [
                            Colors.purple.withOpacity(0.05),
                            Colors.transparent,
                          ],
                          stops: [0.1, 1],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -100,
                    right: -100,
                    child: Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                          colors: [
                            MyColors.purble.withOpacity(0.1),
                            Colors.transparent,
                          ],
                          stops: [0.1, 1.0],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.25,
                    ),
                    child: SingleChildScrollView(
                      // Wrap Column with SingleChildScrollView
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.05,
                            ),
                            child: Text(
                              "Forgot Password",
                              style: TextStyle(
                                fontSize: 32,
                                color: MyColors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.02,
                                right:
                                    MediaQuery.of(context).size.height * 0.02,
                                left: MediaQuery.of(context).size.height * 0.02,
                              ),
                              child: Text(
                                "No worries! Enter your email address below ",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xffcac9cb),
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                right:
                                    MediaQuery.of(context).size.height * 0.02,
                                left: MediaQuery.of(context).size.height * 0.02,
                              ),
                              child: Text(
                                "and we will send you a code to reset ",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xffcac9cb),
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                          Text(
                            "password",
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
                              "Email",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          MyTxtfield(
                            controller: emailController,
                            icon: Icons.email_outlined,
                            hintText: "example@gmail.com",
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.05,
                            ),
                            child: MyButton(
                                color: MyColors.purble,
                                text: "Send",
                                width: MediaQuery.of(context).size.width * 0.6,
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                txtColor: Colors.white,
                                onPressed: () {
                                  context
                                      .read<AuthCubit>()
                                      .sendPasswordResetEmail(
                                          emailController.text.trim());
                                }),
                          ),
                        ],
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
