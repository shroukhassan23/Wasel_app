import 'package:tflite_flutter_plus/tflite_flutter_plus.dart';
import 'dart:typed_data';

class SignLanguageModel {
  Interpreter? _interpreter;
  List<String> categories = [
    "0",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "delete",
    "space"
  ];

  Future<void> loadModel() async {
    _interpreter = await Interpreter.fromAsset(
        'lib/presentation/assets/models/EN_sign_language_model.tflite');
    print("✅ Model Loaded Successfully");
  }

  String predict(List<double> landmarks) {
    if (_interpreter == null) return "";

    // Convert landmarks to Float32List
    var input = Float32List.fromList(landmarks);
    var output =
        List.filled(categories.length, 0.0).reshape([1, categories.length]);

    // Run inference
    _interpreter!.run(input, output);

    // Get prediction
    int index = output[0].indexOf(output[0].reduce((a, b) => a > b ? a : b));
    return categories[index];
  }
}
