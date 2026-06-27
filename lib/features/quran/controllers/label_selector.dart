import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'label_selector.g.dart';

@Riverpod(keepAlive: true)
class LabelSelector extends _$LabelSelector {
  @override
  List<String> build() => [];

  void add(String item) {
    state = [...state, item];
  }

  void load(List<String> items) {
    state = items;
  }

  void del(String item) {
    List<String> _removedList = [...state];
    _removedList.remove(item);
    state = [..._removedList];
  }
}
