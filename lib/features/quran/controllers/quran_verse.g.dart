// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quran_verse.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(QuranVerse)
final quranVerseProvider = QuranVerseProvider._();

final class QuranVerseProvider
    extends $NotifierProvider<QuranVerse, List<Verse>> {
  QuranVerseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'quranVerseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$quranVerseHash();

  @$internal
  @override
  QuranVerse create() => QuranVerse();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Verse> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Verse>>(value),
    );
  }
}

String _$quranVerseHash() => r'e0ab2ff2d1f4bba4e60bfdd46cfd3bcddbcf1ff2';

abstract class _$QuranVerse extends $Notifier<List<Verse>> {
  List<Verse> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<Verse>, List<Verse>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<Verse>, List<Verse>>,
              List<Verse>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
