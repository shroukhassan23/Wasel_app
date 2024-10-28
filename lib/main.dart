import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:wasel_app/businessLogic/cubit/auth_cubit.dart';
import 'package:wasel_app/presentation/screens/app_router.dart';
import 'package:wasel_app/presentation/screens/splash-screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  // Ensure that widget binding is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Run the app
  runApp(MyApp(
    approuter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter approuter;
  MyApp({super.key, required this.approuter});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        onGenerateRoute: AppRouter().generateRoute,
      ),
    );
  }
}
