import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:wasel_app/businessLogic/cubit/auth_cubit.dart';
import 'package:wasel_app/presentation/Components/backicon.dart';
import 'package:wasel_app/presentation/Components/backtxt.dart';
import 'package:wasel_app/presentation/Components/my_button.dart';
import 'package:wasel_app/presentation/Components/my_txtfield.dart';
import 'package:wasel_app/presentation/Components/or_divider.dart';

import 'package:wasel_app/themeing/mycolors.dart';

import 'settings.dart';

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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          showDialog(
            context: context,
            barrierDismissible:
                false, // Prevents dismissing the dialog by tapping outside
            barrierColor: Colors.grey.withOpacity(0.5),
            builder: (context) {
              return Center(
                child: Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: SweepGradient(
                            colors: [
                              Colors.purple.withOpacity(0.1),
                              Colors.purple,
                            ],
                            stops: [0.7, 1.0],
                          ),
                        ),
                      ),
                      Container(
                        height: 65,
                        width: 65,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
        if (state is AuthLoading) {
        } else if (state is Authenticated) {
          Navigator.of(context).pushNamed('users_screen');
        }
      },
      child: BlocBuilder<LanguageCubit, String>(builder: (context, language) {
        return Scaffold(
          resizeToAvoidBottomInset:
              true, // Ensures the screen adjusts to the keyboard
          body: SafeArea(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
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
                      // Logo
                      Positioned(
                        top: -30,
                        right: MediaQuery.of(context).size.width * 0.2,
                        child: Image.asset(
                          "lib/presentation/assets/images/logo1.png",
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: MediaQuery.of(context).size.height * 0.3,
                        ),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.18),
                            child: Text(
                              language == 'عربي' ? "مرحبا" : "Welcome back",
                              style: TextStyle(
                                fontSize: 25,
                                color: MyColors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              right: MediaQuery.of(context).size.width * 0.75,
                            ),
                            child: Text(
                              language == 'عربي'
                                  ? "البريد الالكتروني"
                                  : "Email",
                              style: TextStyle(
                                  color: MyColors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),

                          SizedBox(
                            height: 55,
                            child: MyTxtfield(
                              controller:
                                  emailController, // Connect the controller
                              icon: Icons.email_outlined,
                              hintText: "example@gmail.com",
                              validator: (value) => context
                                  .read<AuthCubit>()
                                  .validateEmail(emailController.text),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              right: MediaQuery.of(context).size.width * 0.65,
                            ),
                            child: Text(
                              language == 'عربي' ? "كلمة المرور" : "Password",
                              style: TextStyle(
                                  color: MyColors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          // Link passwordController to the text field

                          SizedBox(
                            height: 55,
                            child: MyTxtfield(
                              controller:
                                  passwordController, // Connect the controller
                              validator: (value) => context
                                  .read<AuthCubit>()
                                  .validateEmail(emailController.text),
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
                              hintText: language == 'عربي'
                                  ? "كلمة المرور"
                                  : "Password",
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 5, bottom: 10),
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
                                padding: EdgeInsets.only(
                                    right:
                                        MediaQuery.sizeOf(context).width * 0.1,
                                    bottom: 10),
                                child: Text(
                                  language == 'عربي' ? "ذكرني" : "Remember Me",
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.sizeOf(context).width * 0.04,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.1,
                                  bottom:
                                      MediaQuery.of(context).size.width * 0.03,
                                ),
                                child: RichText(
                                    text: TextSpan(
                                        text: language == 'عربي'
                                            ? "هل نسيت كلمةالسر؟"
                                            : "Forgot Password?",
                                        style: TextStyle(
                                          fontSize:
                                              MediaQuery.sizeOf(context).width *
                                                  0.04,
                                          color: MyColors.purble,
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
                              color: MyColors.purble,
                              text: language == 'عربي'
                                  ? "تسجيل الدخول"
                                  : "Log in",
                              padding: EdgeInsets.all(0),
                              width: MediaQuery.of(context).size.width * 0.8,
                              height:
                                  MediaQuery.of(context).size.height * 0.065,
                              txtColor: Colors.white,
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  context.read<AuthCubit>().signIn(
                                      emailController.text,
                                      passwordController.text);
                                }
                              }),
                          OrDivider(),
                          MyButton(
                              color: MyColors.white,
                              text: language == 'عربي'
                                  ? "تسجيل الدخول ب فيس بوك"
                                  : "Log in with Facebook",
                              padding: EdgeInsets.only(top: 10),
                              height: MediaQuery.of(context).size.height * 0.06,
                              width: MediaQuery.of(context).size.width * 0.7,
                              txtColor: MyColors.black,
                              icon:
                                  "lib/presentation/assets/icons/Facebook Logo.png",
                              onPressed: () {
                                context.read<AuthCubit>().signInWithFacebook();
                              }),
                          MyButton(
                              color: MyColors.white,
                              text: language == 'عربي'
                                  ? "تسجيل الدخول ب جوجل"
                                  : "Log in with Google",
                              txtpadding: EdgeInsets.only(right: 22),
                              padding: EdgeInsets.only(
                                top: 5,
                              ),
                              width: MediaQuery.of(context).size.width * 0.7,
                              height: MediaQuery.of(context).size.height * 0.06,
                              txtColor: const Color.fromARGB(255, 0, 0, 0),
                              icon:
                                  "lib/presentation/assets/icons/Google Logo.png",
                              onPressed: () {
                                context
                                    .read<AuthCubit>()
                                    .signInUserWithGoogle();
                              }),
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: language == 'عربي'
                                    ? "ليس لديك حساب؟"
                                    : "Don't have an account? ",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                              TextSpan(
                                  text: "Sign Up",
                                  style: const TextStyle(
                                      color: MyColors.purble, fontSize: 14),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.of(context)
                                          .pushNamed('signup_screen');
                                    })
                            ]),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
