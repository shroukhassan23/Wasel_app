import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wasel_app/businessLogic/cubit/auth_cubit.dart';
import 'package:wasel_app/presentation/Components/backicon.dart';
import 'package:wasel_app/presentation/Components/backtxt.dart';
import 'package:wasel_app/presentation/Components/bottom_bar.dart';
import 'package:wasel_app/presentation/Components/my_circular_button.dart';
import 'package:wasel_app/presentation/screens/sign_translator_screen.dart';
import 'package:wasel_app/themeing/mycolors.dart';

import '../Components/drop_menu.dart';

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
                      fit: BoxFit.fill,
                      image: AssetImage(
                          "lib/presentation/assets/images/boy.png"))),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.04,
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 60,
                  ),
                  /*  signTranslatortxt(),
                SizedBox(
                  width: 10,
                ),*/
                  Padding(
                    padding: const EdgeInsets.only(left: 155),
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: MyColors.lightpurple,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: DropDownmenuLanguage(),
                    ),
                  ),
                ],
              ),
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
                    width: 150,
                    height: 70,
                    icon: Icons.videocam_rounded,
                    buttonColor: MyColors.white,
                    iconColor: MyColors.purble,
                    onPressed: () {
                      Navigator.of(context).pushNamed('sign_translator_screen');
                    },
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Start Sign Translator",
                    style: TextStyle(
                        color: MyColors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Align(
                      alignment: Alignment.bottomCenter, child: BottomNavBar())
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
