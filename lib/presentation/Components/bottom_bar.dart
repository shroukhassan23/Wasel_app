import 'package:flutter/material.dart';
import 'package:wasel_app/presentation/screens/home-screen.dart';
import 'package:wasel_app/presentation/screens/start-recognition-screen.dart';
import 'package:wasel_app/presentation/screens/users_chat_screen.dart';
import 'package:wasel_app/themeing/mycolors.dart';

import '../screens/authScreens/settings.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (index == 4) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SettingsPage()),
      );
      setState(() {
        _selectedIndex = index;
      });
    }
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => UsersScreen()),
      );
      setState(() {
        _selectedIndex = index;
      });
    }
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      color: isDarkMode ? Colors.black : Colors.white,
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: isDarkMode ? Colors.black : Colors.white,
        currentIndex: _selectedIndex,
        selectedItemColor: MyColors.purble,
        unselectedItemColor: isDarkMode ? Colors.white : Colors.black,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/icons/home.png",
              width: 40,
              color: _selectedIndex == 0
                  ? MyColors.purble
                  : (isDarkMode ? Colors.white : Colors.black),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/icons/Sign.png",
              width: 40,
              color: _selectedIndex == 1
                  ? const Color.fromRGBO(159, 102, 198, 1)
                  : (isDarkMode ? Colors.white : Colors.black),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: MyColors.purble,
              ),
              child: Center(
                child: Image.asset(
                  "assets/icons/chat.png",
                  width: 30,
                  color: Colors.white,
                ),
              ),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/icons/Group.png",
              color: _selectedIndex == 3
                  ? MyColors.purble
                  : (isDarkMode ? Colors.white : Colors.black),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/icons/settings.png",
              color: _selectedIndex == 4
                  ? MyColors.purble
                  : (isDarkMode ? Colors.white : Colors.black),
            ),
            label: "",
          ),
        ],
      ),
    );
  }
}
