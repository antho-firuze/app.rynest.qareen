import 'package:flutter/material.dart';
import 'package:qareen/cff/widgets/button/custom_action_button.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({super.key, this.isFavorite = false, this.onPressed});

  final bool isFavorite;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomActionButton(
      tooltip: 'Favorite',
      forAppBar: false,
      onPressed: () {
        onPressed?.call();
        print('Button Pressed');
      },
      icon: isFavorite ? const Icon(Icons.favorite) : const Icon(Icons.favorite_outline),
    );
  }
}
