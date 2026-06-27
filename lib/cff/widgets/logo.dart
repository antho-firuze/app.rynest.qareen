import 'package:flutter/material.dart';
import 'package:qareen/cff/utils/ui_helper.dart';
import 'package:qareen/cff/widgets/custom_image.dart';
import 'package:qareen/features/quran/utils/ui_helper.dart';

class Logo extends StatelessWidget {
  const Logo({super.key, this.width, this.height, this.color, this.onTap, this.src});

  final double? width;
  final double? height;
  final Color? color;
  final dynamic src;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: width,
        height: height,
        child: CustomImage(src: src ?? 'assets/icons/app-icon.png', color: color),
      ),
    );
  }
}

class Logo2 extends StatelessWidget {
  const Logo2({super.key, this.width, this.height, this.color, this.onTap, this.src});

  final double? width;
  final double? height;
  final Color? color;
  final dynamic src;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: width,
        height: height,
        child: CustomImage(src: src ?? 'assets/icons/ic-logo_2-512.png', color: color),
      ),
    );
  }
}

class LogoV extends StatelessWidget {
  const LogoV({super.key, this.width, this.height, this.color, this.onTap, this.src, this.logoHeight});

  final double? width;
  final double? height;
  final double? logoHeight;
  final Color? color;
  final dynamic src;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: width,
        height: height,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomImage(src: src ?? 'assets/icons/app-icon.png', color: color, height: logoHeight),
            Text('Qareen').size(50).clr(oWhite).family('PlayfairDisplay'),
          ],
        ),
      ),
    );
  }
}

class LogoH extends StatelessWidget {
  const LogoH({super.key, this.width, this.height, this.color, this.onTap, this.src, this.logoHeight});

  final double? width;
  final double? height;
  final double? logoHeight;
  final Color? color;
  final dynamic src;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: width,
        height: height,
        child: Row(
          spacing: 10,
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomImage(src: src ?? 'assets/icons/ic-logo_2-512.png', color: color, height: logoHeight),
            Text('Qareen').size((height ?? 40) - 10).family('PlayfairDisplay').clr(color).bold(),
          ],
        ),
      ),
    );
  }
}
