import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart'; // Import for permission handling
import 'package:wasel_app/presentation/Components/backicon.dart';
import 'package:wasel_app/presentation/Components/backtxt.dart';
import 'package:wasel_app/presentation/Components/my_circular_button.dart';
import 'package:wasel_app/themeing/mycolors.dart';
import '../Components/bottom_bar.dart';
import '../Components/drop_menu.dart';

class SignTranslatorScreen extends StatefulWidget {
  const SignTranslatorScreen({super.key});

  @override
  State<SignTranslatorScreen> createState() => _SignTranslatorScreenState();
}

class _SignTranslatorScreenState extends State<SignTranslatorScreen> {
  final TextEditingController _controller = TextEditingController();
  int _charCount = 0;
  final int _maxChars = 160;
  CameraController? _cameracontroller;
  List<CameraDescription>? cameras;
  bool isCameraInitialized = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _charCount = _controller.text.length;
      });
    });
    _requestPermissions(); // Request permissions on init
  }

  // Request camera permission at runtime
  Future<void> _requestPermissions() async {
    var cameraStatus = await Permission.camera.request();
    if (cameraStatus.isGranted) {
      _initCamera(); // Initialize the camera if permission is granted
    } else {
      print("Camera permission denied");
    }
  }

  // Initialize the camera
  Future<void> _initCamera() async {
    try {
      cameras = await availableCameras(); // Get available cameras
      if (cameras == null || cameras!.isEmpty) {
        print("No cameras available.");
        return;
      }

      _cameracontroller = CameraController(cameras![0], ResolutionPreset.high);
      await _cameracontroller!.initialize();

      if (!mounted) return;

      setState(() {
        isCameraInitialized = true;
      });
    } catch (e) {
      print("Error initializing camera: $e");
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _cameracontroller
        ?.dispose(); // Ensure the camera controller is disposed properly
    super.dispose();
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
                  width: 60,
                ),
                signTranslatortxt(),
                SizedBox(
                  width: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: MyColors.lightpurple,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: DropDownmenuLanguage(),
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
          // Only show the camera preview if the camera is initialized
          isCameraInitialized
              ? Stack(
                  children: [
                    CameraPreview(_cameracontroller!),
                  ],
                )
              : Center(child: CircularProgressIndicator()),

          /// **Bottom UI (Button + Text Field + Bottom Nav)**
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// **Row: Send Button + Text Field**
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    children: [
                      /// **Send Button**
                      MyCircularButton(
                        icon: Icons.send,
                        buttonColor: MyColors.purble,
                        iconColor: MyColors.white,
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed('second_sign_translator_screen');
                        },
                      ),
                      const SizedBox(width: 12), // Reduced space

                      /// **Text Field with Border**
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          height: 50,
                          decoration: BoxDecoration(
                            color: MyColors.lightpurple,
                            borderRadius: BorderRadius.circular(12),
                            border:
                                Border.all(color: MyColors.purble, width: 2),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: _controller,
                                  maxLength: _maxChars,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    counterText:
                                        "", // Hides Flutter default counter
                                  ),
                                ),
                              ),
                              Text(
                                "$_charCount/$_maxChars char",
                                style: TextStyle(
                                    color: MyColors.purble, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                /// **Finish Text**
                Padding(
                  padding: const EdgeInsets.only(left: 24, bottom: 8),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Finish",
                      style: TextStyle(
                        color: MyColors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                /// **Bottom Navigation Bar**
                MyBottomBar(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class signTranslatortxt extends StatelessWidget {
  const signTranslatortxt({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Sign Translator",
      style: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
