import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "https://app-2-bajn.onrender.com";

  // تغيير اللغة
  static Future<void> setLanguage(String language, String mode) async {
    final url = Uri.parse("$baseUrl/set-language");

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"language": language, "mode": mode}),
    );

    if (response.statusCode == 200) {
      print("Language set successfully");
    } else {
      print("Failed to set language: ${response.body}");
    }
  }
}
