// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quran_bookmark.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(fetchTags)
final fetchTagsProvider = FetchTagsProvider._();

final class FetchTagsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<String>>,
          List<String>,
          Stream<List<String>>
        >
    with $FutureModifier<List<String>>, $StreamProvider<List<String>> {
  FetchTagsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fetchTagsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fetchTagsHash();

  @$internal
  @override
  $StreamProviderElement<List<String>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<String>> create(Ref ref) {
    return fetchTags(ref);
  }
}

String _$fetchTagsHash() => r'153a8f1db94b168142a61200a89200b192f43c93';

@ProviderFor(TagSelection)
final tagSelectionProvider = TagSelectionProvider._();

final class TagSelectionProvider
    extends $NotifierProvider<TagSelection, List<String>> {
  TagSelectionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tagSelectionProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tagSelectionHash();

  @$internal
  @override
  TagSelection create() => TagSelection();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<String>>(value),
    );
  }
}

String _$tagSelectionHash() => r'5da9eb7f75a3cbcb320183b0f299d243d9f33050';

abstract class _$TagSelection extends $Notifier<List<String>> {
  List<String> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<String>, List<String>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<String>, List<String>>,
              List<String>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(BookmarkSearch)
final bookmarkSearchProvider = BookmarkSearchProvider._();

final class BookmarkSearchProvider
    extends $AsyncNotifierProvider<BookmarkSearch, List<Bookmark>> {
  BookmarkSearchProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bookmarkSearchProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bookmarkSearchHash();

  @$internal
  @override
  BookmarkSearch create() => BookmarkSearch();
}

String _$bookmarkSearchHash() => r'9c6a50328a98fe5d00efcbc61ce940659fe6df08';

abstract class _$BookmarkSearch extends $AsyncNotifier<List<Bookmark>> {
  FutureOr<List<Bookmark>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Bookmark>>, List<Bookmark>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Bookmark>>, List<Bookmark>>,
              AsyncValue<List<Bookmark>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(QuranBookmark)
final quranBookmarkProvider = QuranBookmarkProvider._();

final class QuranBookmarkProvider
    extends $NotifierProvider<QuranBookmark, List<Bookmark>> {
  QuranBookmarkProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'quranBookmarkProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$quranBookmarkHash();

  @$internal
  @override
  QuranBookmark create() => QuranBookmark();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Bookmark> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Bookmark>>(value),
    );
  }
}

String _$quranBookmarkHash() => r'b150c64172c0a474987c278265c7a7283681e0b6';

abstract class _$QuranBookmark extends $Notifier<List<Bookmark>> {
  List<Bookmark> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<Bookmark>, List<Bookmark>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<Bookmark>, List<Bookmark>>,
              List<Bookmark>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
