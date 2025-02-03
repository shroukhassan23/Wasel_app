// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../themeing/mycolors.dart';

class MyCircularButton extends StatelessWidget {
  final double? width;
  final double? height;
  final Function()? onPressed;
  final IconData? icon;
  final Color? buttonColor;
  final Color? iconColor;
  const MyCircularButton({
    Key? key,
    this.width,
    this.height,
    this.onPressed,
    this.icon,
    this.buttonColor,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 60,
      height: height ?? 60,
      decoration: BoxDecoration(
        color: buttonColor,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, color: iconColor, size: 24),
      ),
    );
  }
}
