import 'package:flutter/material.dart';
import 'package:wasel_app/presentation/Components/backtxt.dart';
import 'package:wasel_app/presentation/Components/bottom_bar.dart';
import 'package:wasel_app/presentation/Components/my_button.dart';
import 'package:wasel_app/presentation/screens/sign_translator_screen.dart';

import '../../themeing/mycolors.dart';
import '../Components/backicon.dart';
import '../Components/my_circular_button.dart';

class SecondSignTranslator extends StatefulWidget {
  const SecondSignTranslator({super.key});

  @override
  State<SecondSignTranslator> createState() => _SecondSignTranslatorState();
}

class _SecondSignTranslatorState extends State<SecondSignTranslator> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.04,
            ),
            child: Row(
              children: [
                BackIcon(),
                SizedBox(
                  width: 70,
                ),
                signTranslatortxt(),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.04,
                top: MediaQuery.of(context).size.height * 0.1),
            child: Backtxt(),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.04,
                right: MediaQuery.of(context).size.width * 0.04,
                top: MediaQuery.of(context).size.height * 0.2),
            child: Container(
              height: MediaQuery.of(context).size.width * 0.4,
              decoration: BoxDecoration(
                color: MyColors.lightpurple,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: MyColors.purble, width: 2),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      maxLines: 5,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  //*icons inside textfield
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.copy),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.keyboard_voice_rounded))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.04,
                right: MediaQuery.of(context).size.width * 0.04,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyCircularButton(
                    icon: Icons.replay_circle_filled,
                    buttonColor: MyColors.purble,
                    iconColor: MyColors.white,
                  ),
                  MyCircularButton(
                    icon: Icons.share,
                    buttonColor: MyColors.purble,
                    iconColor: MyColors.white,
                  ),
                ],
              ),
            ),
          ),

          /// **Bottom Navigation Bar**
          Align(alignment: Alignment.bottomCenter, child: MyBottomBar()),
        ],
      ),
    );
  }
}
