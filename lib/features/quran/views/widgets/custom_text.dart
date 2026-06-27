import 'package:flutter/material.dart';
import 'package:qareen/cff/utils/darkmode_utils.dart';
import 'package:qareen/features/quran/utils/ui_helper.dart';

class CustomText extends StatelessWidget {
  const CustomText(this.text, {super.key, this.fontSize = 27.0});

  final String text;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textDirection: TextDirection.rtl,
      text: TextSpan(
        children: [
          TextSpan(
            text: text,
            style: TextStyle(fontFamily: quranFont, fontSize: fontSize, color: Colors.black.whenDark(Colors.white70)),
          ),
        ],
      ),
    );
  }
}
