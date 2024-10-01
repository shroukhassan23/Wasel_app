import 'dart:async';
import 'package:flutter/material.dart';
import 'package:wasel_app/presentation/screens/second-splash.dart';

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
        const Duration(seconds: 4), //Duration of the splash screen
        () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SecondSplash()),
            ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xff56a3e7),
          Color.fromARGB(255, 163, 205, 242),
        ], begin: Alignment.topCenter)),
        child: Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.2,
          ),
          child: Center(
            child: Image.asset("lib/presentation/assets/images/logo1.png"),
          ),
        ),
      ),
    );
  }
}
