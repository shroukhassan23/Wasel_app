import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasel_app/presentation/Components/my_button.dart';
import 'package:wasel_app/presentation/Components/whitebox.dart';
import 'package:wasel_app/presentation/screens/login_screen.dart';
import 'package:wasel_app/presentation/screens/signup_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff56a3e7),
              Color.fromARGB(255, 163, 205, 242),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.3,
                top: MediaQuery.of(context).size.width * 0.2,
                right: MediaQuery.of(context).size.width * 0.1,
              ),
              child: Image.asset(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.width * 0.5,
                "lib/presentation/assets/images/logo2.png",
              ),
            ),
            // padding: EdgeInsets.only(
            //  left: MediaQuery.of(context).size.width * 0.3,
            //  right: MediaQuery.of(context).size.width * 0.1,
            //),
            Positioned(
              left: MediaQuery.of(context).size.width * 0.4,
              top: MediaQuery.of(context).size.width * 0.65,
              child: Text(
                "Wasel",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.width * 0.1,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width * 0.1,
              top: MediaQuery.of(context).size.width * 0.8,
              right: MediaQuery.of(context).size.width * 0.08,
              child: const Text(
                'The best application for translating and understanding Arabic sign language, '
                'translating voice or text into sign language and sharing it with others ',
                style: TextStyle(
                  color: Color.fromARGB(255, 25, 29, 65),
                  fontSize: 18,
                ),
              ),
            ),

            Positioned(
              bottom: 0,
              child: WhiteContainer(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.3,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30, bottom: 10),
                        child: Center(
                          child: MyButton(
                            onPressed: () {
                              Get.to(() => SignupScreen());
                            },
                            width: MediaQuery.of(context).size.width * 0.7,
                            text: "Sign up",
                            txtColor: Colors.white,
                            color: const Color(0xff1778f2),
                          ),
                        ),
                      ),
                      Center(
                        child: MyButton(
                          width: MediaQuery.of(context).size.width * 0.7,
                          text: "Log in",
                          onPressed: () {
                            Get.to(() => LoginScreen());
                          },
                          color: const Color(0xffddeffe),
                          txtColor: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
