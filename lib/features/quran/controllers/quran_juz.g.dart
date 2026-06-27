// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quran_juz.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(QuranJuz)
final quranJuzProvider = QuranJuzProvider._();

final class QuranJuzProvider extends $NotifierProvider<QuranJuz, List<Juz>> {
  QuranJuzProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'quranJuzProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$quranJuzHash();

  @$internal
  @override
  QuranJuz create() => QuranJuz();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Juz> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Juz>>(value),
    );
  }
}

String _$quranJuzHash() => r'0e7ebb4739c310fcb95d95207acfd9d8438779ff';

abstract class _$QuranJuz extends $Notifier<List<Juz>> {
  List<Juz> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<Juz>, List<Juz>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<Juz>, List<Juz>>,
              List<Juz>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
