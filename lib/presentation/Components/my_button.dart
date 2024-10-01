import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Color? color;
  final String text;
  final Color? txtColor;
  final String? icon;
  final double? width;

  final void Function()? onPressed;

  MyButton({
    super.key,
    required this.color,
    required this.text,
    required this.txtColor,
    required this.onPressed,
    this.icon,
    this.width, // Optional icon parameter
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        height: 50,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          color: color,
        ),
        child: icon == null
            ? Center(
                child: Text(
                  text,
                  style: TextStyle(
                    color: txtColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            : Row(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Center the row contents
                children: [
                  ClipOval(
                    child: Image.asset(
                      icon!,
                      height: 24, // Set a fixed height for the icon
                      width: 24, // Set a fixed width for the icon
                      fit: BoxFit.cover, // Ensure the image covers the circle
                    ),
                  ),
                  SizedBox(width: 10), // Space between icon and text
                  Text(
                    text,
                    style: TextStyle(
                      color: txtColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
