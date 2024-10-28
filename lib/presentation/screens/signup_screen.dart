import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasel_app/Auth/user_services.dart';
import 'package:wasel_app/businessLogic/cubit/auth_cubit.dart';
import 'package:wasel_app/presentation/Components/backicon.dart';
import 'package:wasel_app/presentation/Components/my_button.dart';
import 'package:wasel_app/presentation/Components/my_txtfield.dart';
import 'package:wasel_app/presentation/Components/whitebox.dart';
import 'package:wasel_app/presentation/constants.dart';
import 'package:wasel_app/presentation/screens/login_screen.dart';

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
            SnackBar(content: Text('error')),
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
                  BackIcon(), // Back button at the top-left
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
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: Text(
                                  "Create an account",
                                  style: TextStyle(
                                    fontSize: 32,
                                    color: Color(0xff2c6aa2),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  right:
                                      MediaQuery.of(context).size.width * 0.7,
                                ),
                                child: Text(
                                  "full name",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              MyTxtfield(
                                controller: lastnameController,
                                hintText: "Enter your name",
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  right:
                                      MediaQuery.of(context).size.width * 0.75,
                                ),
                                child: const Text(
                                  "Email",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
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
                                  right:
                                      MediaQuery.of(context).size.width * 0.65,
                                ),
                                child: const Text(
                                  "Password",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              MyTxtfield(
                                controller: passwordController,
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
                                validator:
                                    context.read<AuthCubit>().validatePassword,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  right:
                                      MediaQuery.of(context).size.width * 0.5,
                                ),
                                child: const Text(
                                  "Confirm Password",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              MyTxtfield(
                                controller:
                                    confirmPasswordController, // Used confirm password controller
                                icon: Icons.remove_red_eye,
                                hintText: "Confirm Password",
                              ),
                              MyButton(
                                  color: const Color(0xff1778f2),
                                  text: "Create",
                                  width:
                                      MediaQuery.of(context).size.width * 0.85,
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
                                            color: Color(0xff1778f2),
                                            fontSize: 14),
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
