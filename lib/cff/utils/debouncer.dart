import 'dart:async';
import 'dart:ui';

bool _didBack = false;

class Debouncer {
  Debouncer({required this.delay});
  final Duration delay;

  Timer? _timer;

  void run(VoidCallback action) {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(delay, action);
  }

  void confirm(VoidCallback confirm, VoidCallback action) async {
    print('didBack: $_didBack');
    if (_didBack) {
      return action();
    }
    _didBack = true;
    confirm();
    await Future.delayed(delay, () => _didBack = false);
  }
}
