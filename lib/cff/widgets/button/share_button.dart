import 'package:qareen/cff/core/app_color.dart';
import 'package:flutter/material.dart';
import 'package:qareen/cff/widgets/button/custom_action_button.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({super.key, this.color = oWhite, this.onPressed});

  final Color? color;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomActionButton(
      onPressed: onPressed,
      icon: Icon(Icons.share, color: color),
    );
  }
}
