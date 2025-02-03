import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasel_app/Auth/user_services.dart';
import 'package:wasel_app/businessLogic/cubit/auth_cubit.dart';
import 'package:wasel_app/presentation/Components/backicon.dart';
import 'package:wasel_app/presentation/Components/backtxt.dart';
import 'package:wasel_app/presentation/Components/my_button.dart';
import 'package:wasel_app/presentation/Components/my_txtfield.dart';
import 'package:wasel_app/presentation/Components/whitebox.dart';
import 'package:wasel_app/presentation/constants.dart';
import 'package:wasel_app/presentation/screens/login_screen.dart';
import 'package:wasel_app/themeing/mycolors.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignUpscreenState();
}

class _SignUpscreenState extends State<SignupScreen> {
  bool? checkBoxValue = false;
  bool _passwordVisible = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController(); // Added confirm password controller
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
        } else if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('error in sign up')),
          );
        } else if (state is Authenticated) {
          // Navigate to another screen upon successful signup
          Navigator.of(context).pushNamed('login_screen');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Success.')),
          );
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset:
            true, // Ensures the screen adjusts to the keyboard
        body: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02,
                  ),
                  child: BackIcon(),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.04,
                      top: MediaQuery.of(context).size.height * 0.08),
                  child: Backtxt(),
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
                  top: -30,
                  right: MediaQuery.of(context).size.height * 0.15,
                  child: Image.asset(
                    "lib/presentation/assets/images/logo2.png",
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.3,
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
                    top: MediaQuery.of(context).size.height * 0.2,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Text(
                          "Create an account",
                          style: TextStyle(
                            fontSize: 32,
                            color: MyColors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width * 0.7,
                          ),
                          child: Text(
                            "full name",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        MyTxtfield(
                          controller: lastnameController,
                          hintText: "Enter your name",
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
                          controller: emailController,
                          icon: Icons.email_outlined,
                          hintText: "example@gmail.com",
                          validator: (value) => context
                              .read<AuthCubit>()
                              .validateEmail(emailController.text),
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
                          controller: passwordController,
                          icon: _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          obsecuretext: !_passwordVisible,
                          onpress: () {
                            setState(
                              () {
                                _passwordVisible = !_passwordVisible;
                              },
                            );
                          },
                          hintText: "Password",
                          validator: context.read<AuthCubit>().validatePassword,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width * 0.5,
                          ),
                          child: const Text(
                            "Confirm Password",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        MyTxtfield(
                          controller:
                              confirmPasswordController, // Used confirm password controller
                          icon: _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          obsecuretext: !_passwordVisible,
                          onpress: () {
                            setState(
                              () {
                                _passwordVisible = !_passwordVisible;
                              },
                            );
                          },
                          hintText: "Confirm Password",
                        ),
                        MyButton(
                            color: MyColors.purble,
                            text: "Create",
                            width: MediaQuery.of(context).size.width * 0.7,
                            height: MediaQuery.of(context).size.height * 0.07,
                            txtColor: Colors.white,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                context.read<AuthCubit>().signUp(
                                    emailController.text,
                                    passwordController.text);
                              }
                            }),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 25),
                          child: RichText(
                            text: TextSpan(children: [
                              const TextSpan(
                                text: "Already have an account? ",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                              TextSpan(
                                  text: "Log in",
                                  style: const TextStyle(
                                      color: MyColors.purble, fontSize: 14),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.of(context)
                                          .pushNamed('login_screen');
                                    })
                            ]),
                          ),
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
    );
  }
}
