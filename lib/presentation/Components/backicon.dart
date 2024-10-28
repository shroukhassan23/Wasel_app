import 'package:flutter/material.dart';

import 'package:wasel_app/presentation/screens/introscreen.dart';

class BackIcon extends StatelessWidget {
  const BackIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 20,
      left: 16,
      child: TextButton(
        onPressed: () {
          Navigator.of(context).pushNamed('intro_screen');
        },
        child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Color(0xfff1f5f9),
          ),
          child: const Icon(
            Icons.arrow_back,
            color: Color(0xff56a3e7),
          ),
        ),
      ),
    );
  }
}
