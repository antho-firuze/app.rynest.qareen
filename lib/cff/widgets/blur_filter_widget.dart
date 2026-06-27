import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:qareen/cff/utils/ui_helper.dart';

class BlurFilterWidget extends StatelessWidget {
  const BlurFilterWidget({super.key, required this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(height: context.screenHeight / 2, width: double.infinity, child: child),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: Container(color: Colors.white.withAlpha(0)),
        ),
      ],
    );
  }
}
