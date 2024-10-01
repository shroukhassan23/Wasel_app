import 'package:flutter/material.dart';

class WhiteContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final Widget? child;

  const WhiteContainer({
    Key? key,
    this.width,
    this.height,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? MediaQuery.of(context).size.width,
      height: height ?? MediaQuery.of(context).size.height * 0.3,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(MediaQuery.of(context).size.width * 0.15),
          topRight: Radius.circular(MediaQuery.of(context).size.width * 0.15),
        ),
      ),
      child: child,
    );
  }
}
