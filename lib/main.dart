import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasel_app/businessLogic/cubit/auth_cubit.dart';
import 'package:wasel_app/presentation/screens/authScreens/signup_screen.dart';
import 'package:wasel_app/presentation/screens/start-recognition-screen.dart';
import 'package:wasel_app/presentation/screens/users_chat_screen.dart';
import 'package:wasel_app/routing/app_router.dart';
import 'package:wasel_app/presentation/screens/splash-screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'businessLogic/cubit/chat_cubit.dart';
import 'firebase_options.dart';
import 'presentation/screens/authScreens/settings.dart';

late List<CameraDescription> cameras; //list of frames or photos

void main() async {
  // Ensure that widget binding is initialized
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras(); // Initialize the cameras

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => ThemeCubit()),
        BlocProvider(create: (context) => LanguageCubit()),
        BlocProvider(create: (context) => ChatCubit()),
      ],
      child: BlocBuilder<ThemeCubit, bool>(
        builder: (context, isDarkMode) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: StartRecognitionScreen(),
            onGenerateRoute: approuter.generateRoute,
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
          );
        },
      ),
    );
  }
}
