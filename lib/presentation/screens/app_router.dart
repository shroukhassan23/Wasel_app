import 'package:flutter/material.dart';
import 'package:wasel_app/presentation/screens/forgot_password_screen.dart';
import 'package:wasel_app/presentation/screens/home_screen.dart';
import 'package:wasel_app/presentation/screens/introscreen.dart';
import 'package:wasel_app/presentation/screens/login_screen.dart';
import 'package:wasel_app/presentation/screens/new_password_screen.dart';
import 'package:wasel_app/presentation/screens/signup_screen.dart';
import 'package:wasel_app/presentation/screens/verification_screen.dart';

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
    }
  }
}
