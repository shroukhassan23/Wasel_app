import 'package:flutter/material.dart';

class MyTxtfield extends StatelessWidget {
  final IconData? icon;
  final String? hintText;
  MyTxtfield({
    Key? key,
    this.icon,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 3, bottom: 10),
      child: TextFormField(
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Color(0xffa8a7a7)),
            suffixIcon: Icon(icon),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            )),
      ),
    );
  }
}
