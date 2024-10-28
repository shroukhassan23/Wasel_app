import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasel_app/businessLogic/cubit/auth_cubit.dart';

import 'package:wasel_app/presentation/Components/backicon.dart';
import 'package:wasel_app/presentation/Components/my_button.dart';
import 'package:wasel_app/presentation/Components/my_txtfield.dart';
import 'package:wasel_app/presentation/Components/whitebox.dart';
import 'package:wasel_app/presentation/constants.dart';
import 'package:wasel_app/presentation/screens/verification_screen.dart';

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
                                "Forgot Password",
                                style: TextStyle(
                                  fontSize: 32,
                                  color: blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(
                                  top:
                                      MediaQuery.of(context).size.height * 0.02,
                                  right:
                                      MediaQuery.of(context).size.height * 0.02,
                                  left:
                                      MediaQuery.of(context).size.height * 0.02,
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
                                  left:
                                      MediaQuery.of(context).size.height * 0.02,
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
                                  color: const Color(0xff1778f2),
                                  text: "Send",
                                  width:
                                      MediaQuery.of(context).size.width * 0.85,
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
