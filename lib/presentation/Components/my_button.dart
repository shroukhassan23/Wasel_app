// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:wasel_app/themeing/mycolors.dart';

class MyButton extends StatelessWidget {
  final Color? color;
  final String text;
  final Color? txtColor;
  final String? icon;
  final double? width;
  final double? height;
  final void Function()? onPressed;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry txtpadding;

  MyButton({
    Key? key,
    required this.color,
    required this.text,
    required this.txtColor,
    this.icon,
    this.width,
    this.height,
    required this.onPressed,
    this.padding = const EdgeInsets.all(0),
    this.txtpadding = const EdgeInsets.all(0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: MyColors.purble),
          color: color,
        ),
        child: icon == null
            ? Center(
                child: Text(
                  text,
                  style: TextStyle(
                    color: txtColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            : Row(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Center the row contents
                children: [
                  Padding(
                    padding: padding,
                    child: ClipOval(
                      child: Image.asset(
                        icon!,
                        height: 24, // Set a fixed height for the icon
                        width: 24, // Set a fixed width for the icon
                        fit: BoxFit.cover, // Ensure the image covers the circle
                      ),
                    ),
                  ),
                  SizedBox(width: 10), // Space between icon and text
                  Padding(
                    padding: txtpadding,
                    child: Text(
                      text,
                      style: TextStyle(
                        color: txtColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
