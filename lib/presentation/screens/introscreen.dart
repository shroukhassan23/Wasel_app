import 'package:flutter/material.dart';
import 'package:wasel_app/presentation/Components/my_button.dart';
import 'package:wasel_app/presentation/Components/whitebox.dart';
import 'package:wasel_app/presentation/screens/login_screen.dart';
import 'package:wasel_app/presentation/screens/signup_screen.dart';
import 'package:wasel_app/themeing/mycolors.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Stack(
          children: [
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
                left: MediaQuery.of(context).size.width * 0.23,
                top: MediaQuery.of(context).size.width * 0.2,
                right: MediaQuery.of(context).size.width * 0.1,
              ),
              child: Image.asset(
                width: MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.width * 0.5,
                "lib/presentation/assets/images/logo2.png",
              ),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width * 0.1,
              top: MediaQuery.of(context).size.width * 0.8,
              right: MediaQuery.of(context).size.width * 0.05,
              child: const Text(
                'Gesture Vox brings sign language to lifeTranslate gestures into words and speech effortlessly ',
                style: TextStyle(
                  color: Color.fromARGB(255, 25, 29, 65),
                  fontSize: 18,
                ),
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.width * 0.1,
              left: MediaQuery.of(context).size.width * 0.1,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                      child: MyButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('signup_screen');
                        },
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: MediaQuery.of(context).size.height * 0.08,
                        text: "Sign up",
                        txtColor: Colors.white,
                        color: MyColors.purble,
                      ),
                    ),
                    Center(
                      child: MyButton(
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: MediaQuery.of(context).size.height * 0.08,
                        text: "Log in",
                        onPressed: () {
                          Navigator.of(context).pushNamed('login_screen');
                        },
                        color: const Color.fromARGB(255, 254, 254, 254),
                        txtColor: MyColors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
