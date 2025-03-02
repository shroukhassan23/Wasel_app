import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeech {
  final FlutterTts tts = FlutterTts();
  String detectLanguage(String text) {
    final arabicRegex = RegExp(r'[\u0600-\u06FF]'); // الحروف العربية
    return arabicRegex.hasMatch(text) ? "ar" : "en";
  }

  Future<void> speak(String text) async {
    String lang = detectLanguage(text);
    await tts.setLanguage(lang); // تغيير اللغة إلى العربية
    await tts.setPitch(1.0); // درجة الصوت
    await tts.speak(text); // تشغيل الصوت
  }
}
