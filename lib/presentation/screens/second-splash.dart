import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wasel_app/presentation/screens/introscreen.dart';

class SecondSplash extends StatefulWidget {
  const SecondSplash({super.key});

  @override
  State<SecondSplash> createState() => _SecondSplashState();
}

class _SecondSplashState extends State<SecondSplash> {
  @override
  void initState() {
    Timer(
        Duration(seconds: 4),
        () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const IntroScreen()),
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
            bottom: MediaQuery.of(context).size.height * 0.1,
          ),
          child: Center(
            child: Image.asset("lib/presentation/assets/images/logo2.png"),
          ),
        ),
      ),
    );
  }
}
