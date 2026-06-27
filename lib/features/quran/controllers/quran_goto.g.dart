// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quran_goto.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(QuranGoto)
final quranGotoProvider = QuranGotoProvider._();

final class QuranGotoProvider extends $NotifierProvider<QuranGoto, Bookmark?> {
  QuranGotoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'quranGotoProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$quranGotoHash();

  @$internal
  @override
  QuranGoto create() => QuranGoto();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Bookmark? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Bookmark?>(value),
    );
  }
}

String _$quranGotoHash() => r'ed5c5476c3254da22df17fadcd4ba71cf514426e';

abstract class _$QuranGoto extends $Notifier<Bookmark?> {
  Bookmark? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<Bookmark?, Bookmark?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Bookmark?, Bookmark?>,
              Bookmark?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
