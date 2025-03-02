import 'dart:async';
import 'package:flutter/material.dart';
import 'package:wasel_app/presentation/screens/second-splash.dart';
import 'package:wasel_app/themeing/mycolors.dart';

/*Welcome to Wasel App */
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
        const Duration(seconds: 2), //Duration of the splash screen
        () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SecondSplash()),
            ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFF4E4F7), // Light background base
                Color(0xFFE8DEF8),
                Color(0xFFEBDEF3),
              ],
            ),
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
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.05,
              bottom: MediaQuery.of(context).size.height * 0.3,
            ),
            child: Center(
              child: Image.asset("lib/presentation/assets/images/logo1.png"),
            ),
          ),
        ),
      ]),
    );
  }
}
