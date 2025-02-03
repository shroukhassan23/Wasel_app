import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../themeing/mycolors.dart';

class MyBottomBar extends StatelessWidget {
  const MyBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColors.lightpurple,
      child: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Image.asset("lib/presentation/assets/icons/home.png",
                width: 40),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("lib/presentation/assets/icons/sign.svg",
                width: 35),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("lib/presentation/assets/icons/Group.png"),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("lib/presentation/assets/icons/settings.png"),
            label: "",
          ),
        ],
      ),
    );
  }
}
