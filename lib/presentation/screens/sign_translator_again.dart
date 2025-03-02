import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wasel_app/presentation/Components/backtxt.dart';
import 'package:wasel_app/presentation/Components/bottom_bar.dart';
import 'package:wasel_app/presentation/Components/my_button.dart';
import 'package:wasel_app/presentation/screens/authScreens/settings.dart';
import 'package:wasel_app/presentation/screens/sign_translator_screen.dart';
import '../../themeing/mycolors.dart';
import '../Components/backicon.dart';
import '../Components/my_circular_button.dart';
import 'package:http/http.dart' as http;

import '../Components/text_to_speak.dart';

class SecondSignTranslator extends StatefulWidget {
  final String translatedText;
  const SecondSignTranslator({super.key, required this.translatedText});

  @override
  State<SecondSignTranslator> createState() => _SecondSignTranslatorState();
}

class _SecondSignTranslatorState extends State<SecondSignTranslator> {
  late TextEditingController _controller;
  TextToSpeech tts = TextToSpeech();
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.translatedText);
  }

  void copyToClipboard() {
    Clipboard.setData(ClipboardData(text: _controller.text)); // 📋 نسخ النص
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("تم النسخ إلى الحافظة ✅")),
    );
  }

  Future<void> resetTextAPI() async {
    try {
      var response = await http.post(
        Uri.parse("https://app-5-w6g6.onrender.com/reset_text/"),
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode == 200) {
        print("✅ تم إعادة ضبط النص بنجاح عبر API");
        setState(() {
          _controller.clear();
        });
      } else {
        print("❌ فشل إعادة ضبط النص: ${response.statusCode}");
      }
    } catch (e) {
      print("❌ خطأ أثناء إعادة ضبط النص: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.04,
            ),
            child: Row(
              children: [
                BackIcon(),
                SizedBox(
                  width: 70,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.04,
                top: MediaQuery.of(context).size.height * 0.1),
            child: Backtxt(),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.04,
                right: MediaQuery.of(context).size.width * 0.04,
                top: MediaQuery.of(context).size.height * 0.2),
            child: Container(
              height: MediaQuery.of(context).size.width * 0.4,
              decoration: BoxDecoration(
                color: MyColors.lightpurple,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: MyColors.purble, width: 2),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      readOnly: true,
                      maxLines: 5,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  //*icons inside textfield
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () => copyToClipboard(),
                          icon: Icon(
                            Icons.copy,
                            color: MyColors.purble,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              tts.speak(_controller.text);
                            },
                            icon: SizedBox(
                                height: 30,
                                child: Image.asset("assets/icons/sound.png")))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.04,
                right: MediaQuery.of(context).size.width * 0.04,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      resetTextAPI();
                      Navigator.of(context).pushNamed("sign_translator_screen");
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: MyColors.purble,
                      ),
                      child: Center(
                        child: Image.asset(
                          "assets/icons/reload.png",
                          width: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  MyCircularButton(
                    width: 50,
                    height: 50,
                    icon: Icons.share,
                    buttonColor: MyColors.purble,
                    iconColor: MyColors.white,
                  ),
                ],
              ),
            ),
          ),

          /// **Bottom Navigation Bar**
          Align(
            alignment: Alignment.bottomCenter,
            child: BottomNavBar(),
          ),
        ],
      ),
    );
  }
}
