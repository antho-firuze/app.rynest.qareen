import 'package:flutter/material.dart';
import 'package:qareen/cff/utils/darkmode_utils.dart';

class CustomText extends StatelessWidget {
  const CustomText(this.text, {super.key, this.fontSize = 27.0, this.color});

  final String text;
  final double fontSize;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textHeightBehavior: const TextHeightBehavior(
        applyHeightToFirstAscent: false, // Removes top spacing
        applyHeightToLastDescent: false, // Removes bottom spacing
        // leadingDistribution: TextLeadingDistribution.even,
      ),
      textDirection: TextDirection.rtl,
      text: TextSpan(
        children: [
          TextSpan(
            text: text,
            style: TextStyle(
              fontFamily: 'diodrum',
              fontSize: fontSize,
              color: color ?? Colors.black.whenDark(Colors.white70),
            ),
          ),
          // WidgetSpan(
          //   alignment: PlaceholderAlignment.bottom,
          //   child: IconButton(
          //     padding: EdgeInsets.zero, // Removes internal padding
          //     constraints: const BoxConstraints(), // Removes minimum button sizing
          //     icon: const Icon(Icons.info),
          //     onPressed: () {},
          //   ),
          // ),
        ],
      ),
    );
  }
}
