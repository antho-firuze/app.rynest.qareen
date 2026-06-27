import 'package:qareen/cff/core/app_color.dart';
import 'package:flutter/material.dart';
import 'package:qareen/cff/widgets/button/custom_action_button.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({super.key, this.color = oWhite, this.onPressed, this.forAppBar = true, this.showBorder = false});

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
      icon: Icon(Icons.search),
    );
  }
}
