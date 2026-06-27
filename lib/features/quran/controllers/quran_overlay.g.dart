// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quran_overlay.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(QuranOverlay)
final quranOverlayProvider = QuranOverlayProvider._();

final class QuranOverlayProvider extends $NotifierProvider<QuranOverlay, bool> {
  QuranOverlayProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'quranOverlayProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$quranOverlayHash();

  @$internal
  @override
  QuranOverlay create() => QuranOverlay();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$quranOverlayHash() => r'7fdb34cf58481d843f5a91084472a13f4d24e1b6';

abstract class _$QuranOverlay extends $Notifier<bool> {
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
