import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:path/path.dart';
import 'package:qareen/cff/utils/ui_helper.dart';
import 'package:qareen/features/quran/utils/ui_helper.dart';

class VerseNo extends StatelessWidget {
  const VerseNo(this.num, {super.key});

  final int num;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
          join(quranAssetsIcons,'surah-number.svg'),
          colorFilter: ColorFilter.mode(oGold300, BlendMode.srcIn),
        ),
        Text("$num").family(arabicFont).size(18).bold().center(),
      ],
    );
  }
}
