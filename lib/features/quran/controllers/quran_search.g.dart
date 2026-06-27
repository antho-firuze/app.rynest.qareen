// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quran_search.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(QuranSearch)
final quranSearchProvider = QuranSearchProvider._();

final class QuranSearchProvider
    extends $AsyncNotifierProvider<QuranSearch, List<Verse>> {
  QuranSearchProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'quranSearchProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$quranSearchHash();

  @$internal
  @override
  QuranSearch create() => QuranSearch();
}

String _$quranSearchHash() => r'38659910cf8948e3f3f5338f7c240d1093cc40b0';

abstract class _$QuranSearch extends $AsyncNotifier<List<Verse>> {
  FutureOr<List<Verse>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Verse>>, List<Verse>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Verse>>, List<Verse>>,
              AsyncValue<List<Verse>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
