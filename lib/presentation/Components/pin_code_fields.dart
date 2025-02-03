import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeFields extends StatelessWidget {
  PinCodeFields({super.key});
  late String otpCode;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          right: MediaQuery.of(context).size.width * 0.1,
          left: MediaQuery.of(context).size.width * 0.1,
          top: MediaQuery.of(context).size.width * 0.1),
      child: PinCodeTextField(
        appContext: context,
        keyboardType: TextInputType.number,
        length: 4,
        obscureText: false,
        animationType: AnimationType.scale,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(10),
          fieldHeight: 50,
          fieldWidth: 60,
          selectedColor: Color(0xffcac9cb),
          selectedFillColor: Color(0xffcac9cb),
          inactiveFillColor: Color(0xffcac9cb),
          disabledColor: Color(0xffcac9cb),
          inactiveColor: Color(0xffcac9cb),
        ),
        animationDuration: Duration(milliseconds: 300),
        backgroundColor: Colors.white,
        enableActiveFill: true,
        onCompleted: (code) {
          otpCode = code;
          print("OTP Code completed: $code");
        },
        onChanged: (value) {
          print("OTP Code changed: $value");
        },
      ),
    );
  }
}
