import 'package:qareen/cff/core/app_color.dart';
import 'package:flutter/material.dart';
import 'package:qareen/cff/widgets/button/custom_action_button.dart';
import 'package:super_icons/super_icons.dart';

class MoreButton extends StatelessWidget {
  const MoreButton({super.key, this.color = oWhite, this.onPressed, this.forAppBar = true, this.showBorder = false});

  final Color? color;
  final bool forAppBar;
  final bool showBorder;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomActionButton(
      forAppBar: forAppBar,
      showBorder: showBorder,
      onPressed: onPressed,
      icon: Icon(SuperIcons.lc_moreVertical),
    );
  }
}
