import 'package:flutter/material.dart';

import '../../../themeing/mycolors.dart';

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Positioned(
          top: -150,
          right: -100,
          child: Container(
            width: 350,
            height: 350,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  Colors.purple.withOpacity(0.1),
                  Colors.transparent,
                ],
                stops: [0.3, 1.0],
              ),
            ),
          ),
        ),
        Positioned(
          top: 100,
          left: -100,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 500,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  Colors.purple.withOpacity(0.05),
                  Colors.transparent,
                ],
                stops: [0.1, 1],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: -100,
          right: -100,
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  MyColors.purble.withOpacity(0.1),
                  Colors.transparent,
                ],
                stops: [0.1, 1.0],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
