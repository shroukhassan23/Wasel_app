import 'package:flutter/material.dart';
import 'package:wasel_app/themeing/mycolors.dart';

class DropDownmenuLanguage extends StatefulWidget {
  const DropDownmenuLanguage({super.key});

  @override
  State<DropDownmenuLanguage> createState() => _DropDownmenuLanguageState();
}

class _DropDownmenuLanguageState extends State<DropDownmenuLanguage> {
  String? dropdownValue = "A";

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        value: dropdownValue,
        icon: Icon(Icons.arrow_drop_down,
            color: Colors.white, size: 28), // Icon color
        dropdownColor:
            MyColors.lightpurple, // Background color of dropdown menu
        borderRadius: BorderRadius.circular(12),
        style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500), // Text color inside button
        items: [
          DropdownMenuItem(
            value: "A",
            child: Row(
              children: [
                Icon(Icons.flag, color: Colors.blueAccent, size: 20),
                SizedBox(width: 10),
                Text("En", style: TextStyle(color: Colors.black, fontSize: 16)),
              ],
            ),
          ),
          DropdownMenuItem(
            value: "E",
            child: Row(
              children: [
                Icon(Icons.flag, color: Colors.redAccent, size: 20),
                SizedBox(width: 10),
                Text("S", style: TextStyle(color: Colors.black, fontSize: 16)),
              ],
            ),
          ),
        ],
        onChanged: (newValue) {
          setState(() {
            dropdownValue = newValue;
          });
        },
      ),
    );
  }
}
