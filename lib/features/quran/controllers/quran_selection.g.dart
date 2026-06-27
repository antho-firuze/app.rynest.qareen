// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quran_selection.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(QuranSelection)
final quranSelectionProvider = QuranSelectionProvider._();

final class QuranSelectionProvider
    extends $NotifierProvider<QuranSelection, Bookmark?> {
  QuranSelectionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'quranSelectionProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$quranSelectionHash();

  @$internal
  @override
  QuranSelection create() => QuranSelection();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Bookmark? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Bookmark?>(value),
    );
  }
}

String _$quranSelectionHash() => r'8375cc728b4167d0d84d2eb2eec1b56167e8f255';

abstract class _$QuranSelection extends $Notifier<Bookmark?> {
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
