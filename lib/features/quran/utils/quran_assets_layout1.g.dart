// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quran_assets_layout1.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(QuranAssetsLayout1)
final quranAssetsLayout1Provider = QuranAssetsLayout1Provider._();

final class QuranAssetsLayout1Provider
    extends $NotifierProvider<QuranAssetsLayout1, bool> {
  QuranAssetsLayout1Provider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'quranAssetsLayout1Provider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$quranAssetsLayout1Hash();

  @$internal
  @override
  QuranAssetsLayout1 create() => QuranAssetsLayout1();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$quranAssetsLayout1Hash() =>
    r'5b5c34629f8a322b3536ab57249bc557a05f0cb3';

abstract class _$QuranAssetsLayout1 extends $Notifier<bool> {
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
