// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:wasel_app/presentation/screens/authScreens/login_screen.dart';
import 'package:wasel_app/presentation/screens/authScreens/signup_screen.dart';
import 'package:wasel_app/presentation/screens/chatui.dart';
import 'package:wasel_app/presentation/screens/forgot_password_screen.dart';
import 'package:wasel_app/presentation/screens/introscreen.dart';
import 'package:wasel_app/presentation/screens/new_password_screen.dart';
import 'package:wasel_app/presentation/screens/sign_translator_screen.dart';
import 'package:wasel_app/presentation/screens/verification_screen.dart';

import '../presentation/screens/home-screen.dart';
import '../presentation/screens/sign_translator_again.dart';
import '../presentation/screens/start-recognition-screen.dart';
import '../presentation/screens/users_chat_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'login_screen':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case 'signup_screen':
        return MaterialPageRoute(builder: (_) => SignupScreen());
      case 'forgot_password_screen':
        return MaterialPageRoute(builder: (_) => ForgotPasswordScreen());
      case 'create_password_screen':
        return MaterialPageRoute(builder: (_) => CreatePassScreen());
      case 'verification_screen':
        return MaterialPageRoute(builder: (_) => VerificationScreen());
      case 'intro_screen':
        return MaterialPageRoute(builder: (_) => IntroScreen());
      case 'home_screen':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case 'sign_translator_screen':
        return MaterialPageRoute(builder: (_) => SignTranslatorScreen());
      case 'start_recognition_screen':
        return MaterialPageRoute(builder: (_) => StartRecognitionScreen());
      case 'second_sign_translator_screen':
        return MaterialPageRoute(
            builder: (_) => SecondSignTranslator(
                  translatedText: '',
                ));

      case 'users_screen':
        return MaterialPageRoute(builder: (_) => UsersScreen());
    }
    return MaterialPageRoute(builder: (_) => HomeScreen());
  }
}
