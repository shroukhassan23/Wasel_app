import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:wasel_app/themeing/mycolors.dart';

class DropDownmenuLanguage extends StatefulWidget {
  const DropDownmenuLanguage({super.key});

  @override
  State<DropDownmenuLanguage> createState() => _DropDownmenuLanguageState();
}

class _DropDownmenuLanguageState extends State<DropDownmenuLanguage> {
  String? selectedLanguage = "A"; // اللغة الافتراضية (English)
  String? selectedMode = "letters"; // الوضع الافتراضي (حروف)

  Future<void> setLanguage(String language, String mode) async {
    const String url = "https://app-5-w6g6.onrender.com/set_language/";

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "language": language,
          "mode": mode,
        }),
      );

      if (response.statusCode == 200) {
        print("✅ اللغة والوضع تم تعيينهما إلى: $language - $mode");
      } else {
        print("⚠️ فشل في تغيير اللغة، كود الاستجابة: ${response.statusCode}");
      }
    } catch (e) {
      print("❌ خطأ أثناء الاتصال بـ API: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // 🔵 القائمة المنسدلة لاختيار اللغة
        DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: selectedLanguage,
            icon: const Icon(Icons.arrow_drop_down,
                color: Colors.white, size: 25),
            dropdownColor: MyColors.lightpurple,
            borderRadius: BorderRadius.circular(12),
            style: const TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
            items: [
              DropdownMenuItem(
                value: "A",
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: SizedBox(
                        width: 15,
                        height: 20,
                        child: Image.asset(
                            "lib/presentation/assets/icons/united-states-of-america.png"),
                      ),
                    ),
                    const SizedBox(width: 5),
                    const Text("En",
                        style: TextStyle(color: Colors.black, fontSize: 15)),
                  ],
                ),
              ),
              DropdownMenuItem(
                value: "E",
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: SizedBox(
                        width: 15,
                        height: 20,
                        child: Image.asset(
                            "lib/presentation/assets/icons/flag.png"),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text("Ar",
                        style: TextStyle(color: Colors.black, fontSize: 15)),
                  ],
                ),
              ),
            ],
            onChanged: (newValue) {
              setState(() {
                selectedLanguage = newValue!;
              });

              // إرسال الطلب إلى API عند تغيير اللغة
              setLanguage(selectedLanguage == "A" ? "English" : "Arabic",
                  selectedMode!);
            },
          ),
        ),

        // 🔵 القائمة المنسدلة لاختيار نوع الإدخال (حروف أو أرقام)
        DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: selectedMode,
            isDense: true,
            icon: const Icon(Icons.arrow_drop_down,
                color: Colors.white, size: 25),
            dropdownColor: MyColors.lightpurple,
            borderRadius: BorderRadius.circular(12),
            style: const TextStyle(
                color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
            items: [
              DropdownMenuItem(
                value: "letters",
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 5), // تقليل المسافة الجانبية
                  child: Text("ABC",
                      style: TextStyle(color: Colors.black, fontSize: 14)),
                ),
              ),
              DropdownMenuItem(
                value: "numbers",
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 3), // تقليل المسافة الجانبية
                  child: Text("123",
                      style: TextStyle(color: Colors.black, fontSize: 14)),
                ),
              ),
            ],
            onChanged: (newValue) {
              setState(() {
                selectedMode = newValue!;
              });

              // إرسال الطلب إلى API عند تغيير نوع الإدخال
              setLanguage(selectedLanguage == "A" ? "English" : "Arabic",
                  selectedMode!);
            },
          ),
        ),
      ],
    );
  }
}
