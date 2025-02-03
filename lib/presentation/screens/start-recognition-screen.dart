import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wasel_app/businessLogic/cubit/auth_cubit.dart';
import 'package:wasel_app/presentation/Components/backicon.dart';
import 'package:wasel_app/presentation/Components/backtxt.dart';
import 'package:wasel_app/presentation/Components/my_circular_button.dart';
import 'package:wasel_app/presentation/screens/sign_translator_screen.dart';
import 'package:wasel_app/themeing/mycolors.dart';

class StartRecognitionScreen extends StatelessWidget {
  const StartRecognitionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                          "lib/presentation/assets/images/boy.png"))),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.02,
              ),
              child: BackIcon(),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.04,
                  top: MediaQuery.of(context).size.height * 0.08),
              child: Backtxt(),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  MyCircularButton(
                    width: 170,
                    height: 80,
                    icon: Icons.camera_alt_outlined,
                    buttonColor: MyColors.white,
                    iconColor: MyColors.purble,
                    onPressed: () {
                      Navigator.of(context).pushNamed('sign_translator_screen');
                    },
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Start",
                    style: TextStyle(
                        color: MyColors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      color: MyColors.white,
                      child: BottomNavigationBar(items: [
                        BottomNavigationBarItem(
                            icon: Image.asset(
                                width: 40,
                                "lib/presentation/assets/icons/home.png"),
                            label: ""),
                        BottomNavigationBarItem(
                            icon: SvgPicture.asset(
                              "lib/presentation/assets/icons/sign.svg",
                              width: 35,
                            ),
                            label: ""),
                        BottomNavigationBarItem(
                            icon: Image.asset(
                                "lib/presentation/assets/icons/Group.png"),
                            label: ""),
                        BottomNavigationBarItem(
                            icon: Image.asset(
                                "lib/presentation/assets/icons/settings.png"),
                            label: ""),
                      ]),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
