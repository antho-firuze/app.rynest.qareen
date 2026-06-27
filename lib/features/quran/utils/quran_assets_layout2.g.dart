// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quran_assets_layout2.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(QuranAssetsLayout2)
final quranAssetsLayout2Provider = QuranAssetsLayout2Provider._();

final class QuranAssetsLayout2Provider
    extends $NotifierProvider<QuranAssetsLayout2, bool> {
  QuranAssetsLayout2Provider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'quranAssetsLayout2Provider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$quranAssetsLayout2Hash();

  @$internal
  @override
  QuranAssetsLayout2 create() => QuranAssetsLayout2();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$quranAssetsLayout2Hash() =>
    r'5bb33acc76f9b53a045e24d5ad88eb4b6c59036e';

abstract class _$QuranAssetsLayout2 extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
