import 'package:flutter/material.dart';
import 'package:qareen/cff/widgets/custom_image.dart';
import 'package:qareen/cff/core/app_color.dart';

class CustomAvatar extends StatelessWidget {
  const CustomAvatar({
    super.key,
    this.image,
    this.initial,
    this.size = 45,
    // this.ratio = 1.0,
    this.fit = BoxFit.cover,
    this.showBorder = false,
    this.isCircle = true,
    this.onTap,
  });

  final String? image;
  final String? initial;
  final double size;
  final BoxFit fit;
  // final double ratio;
  final bool showBorder;
  final bool isCircle;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final imageSrc = image ?? 'assets/images/avatar-men.png';
    final errorWidget = CustomImage(src: 'assets/images/avatar-broken.png', onTap: onTap, fit: fit);
    return SizedBox(
      width: size,
      height: size,
      child: Container(
        decoration: BoxDecoration(
          color: primaryLight,
          border: Border.all(color: primaryLight, width: 2),
          borderRadius: isCircle ? null : BorderRadius.circular(12),
          shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(45),
          child: isCircle
              ? Center(
                  child: OverflowBox(
                    maxWidth: size * 1.0,
                    maxHeight: size * 1.0,
                    child: CustomImage(src: imageSrc, onTap: onTap, fit: BoxFit.fill, errorWidget: errorWidget),
                  ),
                )
              : Center(
                  child: OverflowBox(
                    maxWidth: size * 1.0,
                    maxHeight: size * 1.0,
                    child: CustomImage(src: imageSrc, onTap: onTap, fit: fit, errorWidget: errorWidget),
                  ),
                ),
        ),
      ),
    );
    // return SizedBox(
    //   width: width,
    //   height: height,
    //   child: Container(
    //     // padding: EdgeInsets.all(border ?? 6),
    //     decoration: BoxDecoration(
    //       color: primaryLight,
    //       borderRadius: shape == BoxShape.circle ? null : borderRadius ?? BorderRadius.circular(12),
    //       shape: shape,
    //     ),
    //     child: Stack(
    //       clipBehavior: Clip.none,
    //       fit: StackFit.passthrough,
    //       children: [
    //         Positioned.fill(
    //           child: ClipRRect(
    //             borderRadius: borderRadius ?? BorderRadius.circular(12),
    //             child: image == null && initial == null
    //                 ? CustomImage(src: 'assets/images/avatar.png', onTap: onTap)
    //                 : image != null
    //                     ? CustomImage(src: image, onTap: onTap)
    //                     : LogoInitial(initial: initial!),
    //           ),
    //         ),
    //         if (onTapUpdate != null)
    //           Positioned(
    //             bottom: 0,
    //             right: 0,
    //             child: CustomIcon(
    //               SuperIcons.is_camera_outline,
    //               size: 30,
    //               backgroundColor: Colors.black45,
    //               onPressed: onTapUpdate!,
    //             ),
    //           ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
