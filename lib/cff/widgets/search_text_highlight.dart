import 'package:flutter/material.dart';

class SearchTextHighlight extends StatelessWidget {
  final String text;
  final String query;
  final TextStyle highlightStyle;
  final TextStyle normalStyle;

  const SearchTextHighlight({
    super.key,
    required this.text,
    required this.query,
    this.highlightStyle = const TextStyle(
      backgroundColor: Colors.yellow,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
    this.normalStyle = const TextStyle(color: Colors.black),
  });

  @override
  Widget build(BuildContext context) {
    if (query.isEmpty || !text.toLowerCase().contains(query.toLowerCase())) {
      return Text(text, style: normalStyle);
    }

    final List<InlineSpan> spans = [];
    final String lowerText = text.toLowerCase();
    final String lowerQuery = query.toLowerCase();

    int start = 0;
    int indexOfMatch;

    while ((indexOfMatch = lowerText.indexOf(lowerQuery, start)) != -1) {
      // 1. Append regular text leading up to the match
      if (indexOfMatch > start) {
        spans.add(TextSpan(text: text.substring(start, indexOfMatch), style: normalStyle));
      }

      // 2. Append the matched highlighted text
      spans.add(TextSpan(text: text.substring(indexOfMatch, indexOfMatch + query.length), style: highlightStyle));

      start = indexOfMatch + query.length;
    }

    // 3. Append remaining trailing text
    if (start < text.length) {
      spans.add(TextSpan(text: text.substring(start), style: normalStyle));
    }

    return RichText(text: TextSpan(children: spans));
  }
}
