// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quran_chapter.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(QuranChapter)
final quranChapterProvider = QuranChapterProvider._();

final class QuranChapterProvider
    extends $NotifierProvider<QuranChapter, List<Chapter>> {
  QuranChapterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'quranChapterProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$quranChapterHash();

  @$internal
  @override
  QuranChapter create() => QuranChapter();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Chapter> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Chapter>>(value),
    );
  }
}

String _$quranChapterHash() => r'b4b60b26ad5d4dd51f6f8a5ccb8c09845ddc13bb';

abstract class _$QuranChapter extends $Notifier<List<Chapter>> {
  List<Chapter> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<Chapter>, List<Chapter>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<Chapter>, List<Chapter>>,
              List<Chapter>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
