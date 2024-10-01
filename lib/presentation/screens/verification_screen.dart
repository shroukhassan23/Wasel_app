// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:wasel_app/presentation/Components/backicon.dart';
import 'package:wasel_app/presentation/Components/my_button.dart';
import 'package:wasel_app/presentation/Components/whitebox.dart';
import 'package:wasel_app/presentation/constants.dart';

class VerificationScreen extends StatefulWidget {
  VerificationScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  late String otpCode;

  Widget _buildPinCodeFields(BuildContext context) {
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
            inactiveColor: Color(0xffcac9cb)),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
          true, // Ensures the screen adjusts to the keyboard
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff56a3e7),
                  Color.fromARGB(255, 163, 205, 242),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Stack(
              children: [
                // Back button positioned at the top-left
                BackIcon(),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.1,
                    left: MediaQuery.of(context).size.width * 0.08,
                  ),
                  child: Text(
                    "back",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),

                // Logo in the middle of the screen
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.01,
                    left: MediaQuery.of(context).size.width * 0.3,
                    right: MediaQuery.of(context).size.width * 0.2,
                  ),
                  child: Image.asset(
                    "lib/presentation/assets/images/logo2.png",
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.3,
                  ),
                ),

                // White container at the bottom of the screen
                Positioned(
                  bottom: 0,
                  child: WhiteContainer(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.72,
                    child: SingleChildScrollView(
                      // Wrap Column with SingleChildScrollView
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.05,
                            ),
                            child: Text(
                              "Verify Account",
                              style: TextStyle(
                                fontSize: 32,
                                color: blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                right:
                                    MediaQuery.of(context).size.height * 0.02,
                                left: MediaQuery.of(context).size.height * 0.02,
                              ),
                              child: Text(
                                "Please enter the code just send to ",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xffcac9cb),
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                          Text(
                            "email",
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xffcac9cb),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.01,
                              right: MediaQuery.of(context).size.width * 0.6,
                            ),
                            child: const Text(
                              "Enter Code",
                              style: TextStyle(
                                fontSize: 24,
                              ),
                            ),
                          ),
                          _buildPinCodeFields(context),
                          Text("Didn't receive code?"),
                          Text("00:52"),
                          Padding(
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.05,
                            ),
                            child: MyButton(
                                color: const Color(0xff1778f2),
                                text: "Verify",
                                width: MediaQuery.of(context).size.width * 0.85,
                                txtColor: Colors.white,
                                onPressed: () {}),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
