import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 1.5,
            color: Colors.grey,
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "Or With",
            style: TextStyle(
              color: Color.fromARGB(255, 37, 35, 35),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            thickness: 1.5,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
