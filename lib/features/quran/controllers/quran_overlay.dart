import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quran_overlay.g.dart';

@Riverpod(keepAlive: true)
class QuranOverlay extends _$QuranOverlay {
  @override
  bool build() => false;

  void toggle([bool? value]) => state = value == null ? !state : value;
}
