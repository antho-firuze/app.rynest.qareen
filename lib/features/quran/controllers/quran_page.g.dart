// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quran_page.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(quranPages)
final quranPagesProvider = QuranPagesProvider._();

final class QuranPagesProvider
    extends $NotifierProvider<quranPages, List<QuranPage>> {
  QuranPagesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'quranPagesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$quranPagesHash();

  @$internal
  @override
  quranPages create() => quranPages();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<QuranPage> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<QuranPage>>(value),
    );
  }
}

String _$quranPagesHash() => r'b91e08469474b6e09cbe477809f1b54aac2939e2';

abstract class _$quranPages extends $Notifier<List<QuranPage>> {
  List<QuranPage> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<QuranPage>, List<QuranPage>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<QuranPage>, List<QuranPage>>,
              List<QuranPage>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
