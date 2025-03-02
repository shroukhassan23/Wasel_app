import 'package:flutter/material.dart';

class Backtxt extends StatelessWidget {
  const Backtxt({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Back",
      style: const TextStyle(
          color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
    );
  }
}
