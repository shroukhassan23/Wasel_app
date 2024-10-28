// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MyTxtfield extends StatelessWidget {
  final TextEditingController? controller;
  final IconData? icon;
  final String? hintText;
  final String? Function(String?)? validator;
  final bool? obsecuretext;
  void Function()? onpress;
  MyTxtfield({
    Key? key,
    this.controller,
    this.icon,
    this.hintText,
    this.validator,
    this.obsecuretext,
    this.onpress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 3, bottom: 10),
      child: TextFormField(
        controller: controller,
        validator: validator,
        obscureText: obsecuretext ?? false,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Color(0xffa8a7a7)),
            suffixIcon: IconButton(
              icon: Icon(icon),
              onPressed: onpress,
            ),
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
