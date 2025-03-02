import 'dart:convert';
import 'package:http/http.dart' as http;

class TextCorrectionService {
  static const String apiUrl = "https://api.languagetool.org/v2/check";

  /// 🔍 **تصحيح النصوص العربية والإنجليزية**
  static Future<String> correctText(String text,
      {String language = "ar"}) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/x-www-form-urlencoded"},
        body: {
          "text": text,
          "language": language, // يدعم "ar" للعربية و "en" للإنجليزية
        },
      );

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        List matches = jsonResponse["matches"];

        if (matches.isEmpty) return text; // لا يوجد أخطاء

        String correctedText = text;
        for (var match in matches.reversed) {
          String incorrectWord = match["context"]["text"];
          String replacement = match["replacements"].isNotEmpty
              ? match["replacements"][0]["value"]
              : incorrectWord;

          correctedText =
              correctedText.replaceFirst(incorrectWord, replacement);
        }

        return correctedText;
      } else {
        print("❌ خطأ في API: ${response.statusCode}");
        return text;
      }
    } catch (e) {
      print("❌ استثناء أثناء التصحيح: $e");
      return text;
    }
  }
}
