import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasel_app/Auth/user_services.dart';
import 'package:wasel_app/businessLogic/cubit/auth_cubit.dart';
import 'package:wasel_app/presentation/screens/introscreen.dart';
import 'package:wasel_app/themeing/mycolors.dart';

class SecondSplash extends StatefulWidget {
  const SecondSplash({super.key});

  @override
  State<SecondSplash> createState() => _SecondSplashState();
}

class _SecondSplashState extends State<SecondSplash> {
  @override
  void initState() {
    Timer(Duration(seconds: 4), () {
      final authCubit = context.read<AuthCubit>();
      authCubit.checkAuthStatus();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is Authenticated) {
          Navigator.of(context).pushNamed('start_recognition_screen');
        } else {
          Navigator.of(context).pushNamed('intro_screen');
        }
      },
      child: Scaffold(
        body: Stack(children: [
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
                child: Image.asset("lib/presentation/assets/images/logo2.png"),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
