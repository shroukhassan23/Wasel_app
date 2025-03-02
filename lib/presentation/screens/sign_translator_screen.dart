import 'dart:async';
import 'dart:convert';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';
import 'package:wasel_app/API/text_correction.dart';
import 'package:wasel_app/presentation/Components/backtxt.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;
import '../../themeing/mycolors.dart';
import '../Components/backicon.dart';
import '../Components/my_circular_button.dart';
import 'sign_translator_again.dart';

class SignTranslatorScreen extends StatefulWidget {
  const SignTranslatorScreen({super.key});

  @override
  State<SignTranslatorScreen> createState() => _SignTranslatorScreenState();
}

class _SignTranslatorScreenState extends State<SignTranslatorScreen> {
  CameraController? _cameracontroller;
  List<CameraDescription>? cameras;
  bool isCameraInitialized = false;
  bool isDetecting = false;
  final TextEditingController _controller = TextEditingController();
  int _charCount = 0;
  final int _maxChars = 160;
  String lastPrediction = ""; // ✅ حفظ آخر تنبؤع
  int repeatedCount = 0; // عداد التكرار
  List<Rect> _boundingBoxes = [];
  @override
  void initState() {
    super.initState();
    _requestPermissions();
  }

  Future<void> _requestPermissions() async {
    var cameraStatus = await Permission.camera.request();
    if (cameraStatus.isGranted) {
      _initCamera();
    } else {
      print("Camera permission denied");
    }
  }

  Future<void> correctTextAutomatically() async {
    String text = _controller.text;
    if (text.isEmpty) return;

    String language = detectLanguage(text); // 🔹 تحديد اللغة
    String correctedText =
        await TextCorrectionService.correctText(text, language: language);

    setState(() {
      _controller.text = correctedText;
    });
  }

  Future<void> _initCamera() async {
    try {
      cameras = await availableCameras();
      if (cameras == null || cameras!.isEmpty) {
        print("No cameras available.");
        return;
      }
      _cameracontroller =
          CameraController(cameras![1], ResolutionPreset.medium);
      await _cameracontroller!.initialize();
      if (!mounted) return;
      setState(() {
        isCameraInitialized = true;
      });

      // 📸 بدء عملية التقاط الصور بعد تهيئة الكاميرا
      captureAndSendImage();
    } catch (e) {
      print("Error initializing camera: $e");
    }
  }

  String detectLanguage(String text) {
    final arabicRegex = RegExp(r'[\u0600-\u06FF]');
    if (arabicRegex.hasMatch(text)) {
      return "ar"; // 🔹 النص عربي
    } else {
      return "en"; // 🔹 النص إنجليزي
    }
  }

  Future<void> captureAndSendImage() async {
    if (_cameracontroller == null ||
        !_cameracontroller!.value.isInitialized ||
        isDetecting) {
      return;
    }

    setState(() {
      isDetecting = true;
      lastPrediction = " ";
    });

    try {
      final XFile imageFile = await _cameracontroller!.takePicture();
      Uint8List imageBytes = await imageFile.readAsBytes();
      String base64Image = base64Encode(imageBytes);

      var response = await http.post(
        Uri.parse("https://app-5-w6g6.onrender.com/predict/"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"frame": base64Image}),
      );

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(utf8.decode(response.bodyBytes));
        String? predictedText = jsonResponse['text'];

        if (predictedText != null && predictedText.isNotEmpty) {
          if (predictedText == lastPrediction) {
            repeatedCount++;
          } else {
            repeatedCount = 0;
          }

          if (repeatedCount <= 1) {
            setState(() {
              _controller.text += predictedText;
              lastPrediction = predictedText;
              resetTextAPI();
              _charCount++;
            });

            /// ✅ **تصحيح النص بعد التحديث**
            correctTextAutomatically();
          }
        }
      } else {
        print("❌ خطأ في API: ${response.statusCode}");
      }
    } catch (e) {
      print("❌ خطأ أثناء التقاط أو إرسال الصورة: $e");
    }

    if (mounted) {
      setState(() {
        isDetecting = false;
        lastPrediction = "";
      });

      Future.delayed(Duration(seconds: 1), () {
        if (mounted) {
          captureAndSendImage();
        }
        _boundingBoxes = [
          Rect.fromLTWH(100, 200, 150, 200), // Example bounding box
        ];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
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
            Text(
              "Sign Translator",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.04,
            top: MediaQuery.of(context).size.height * 0.1),
        child: Backtxt(),
      ),
      isCameraInitialized
          ? Center(
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.7,
                  decoration: BoxDecoration(
                    color: MyColors.purble,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: CameraPreview(
                        _cameracontroller!,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            lastPrediction,
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ))),
            )
          : Center(child: CircularProgressIndicator()),
      Align(
          alignment: Alignment.bottomCenter,
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            /// **Row: Send Button + Text Field**
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  /// **Send Button**
                  MyCircularButton(
                    width: 45,
                    height: 45,
                    icon: Icons.send,
                    buttonColor: MyColors.purble,
                    iconColor: MyColors.white,
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SecondSignTranslator(
                              translatedText: _controller.text),
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 12),

                  /// **Text Field with Border**
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      height: 55,
                      decoration: BoxDecoration(
                        color: MyColors.lightpurple,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: MyColors.purble, width: 2),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              readOnly: true,
                              controller: _controller,
                              maxLength: _maxChars,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                counterText: "",
                              ),
                            ),
                          ),
                          Text(
                            "$_charCount/$_maxChars char",
                            style:
                                TextStyle(color: MyColors.purble, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  MyCircularButton(
                    width: 45,
                    height: 45,
                    icon: Icons.refresh,
                    buttonColor: MyColors.purble,
                    iconColor: MyColors.white,
                    onPressed: () {
                      resetTextAPI();
                      _controller.clear();
                      _charCount = 0;
                    },
                  ),
                ],
              ),
            ),
          ]))
    ]));
  }

  Future<void> resetTextAPI() async {
    try {
      var response = await http.post(
        Uri.parse("https://app-5-w6g6.onrender.com/reset_text/"),
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode == 200) {
        print("✅ تم إعادة ضبط النص بنجاح عبر API");
      } else {
        print("❌ فشل إعادة ضبط النص: ${response.statusCode}");
      }
    } catch (e) {
      print("❌ خطأ أثناء إعادة ضبط النص: $e");
    }
  }

  @override
  void dispose() {
    _cameracontroller?.dispose();
    _controller.dispose();
    super.dispose();
  }
}
