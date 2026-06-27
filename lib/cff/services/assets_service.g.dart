// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assets_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(assetsService)
final assetsServiceProvider = AssetsServiceProvider._();

final class AssetsServiceProvider
    extends $FunctionalProvider<AssetsService, AssetsService, AssetsService>
    with $Provider<AssetsService> {
  AssetsServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'assetsServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$assetsServiceHash();

  @$internal
  @override
  $ProviderElement<AssetsService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AssetsService create(Ref ref) {
    return assetsService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AssetsService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AssetsService>(value),
    );
  }
}

String _$assetsServiceHash() => r'8e203e8307d049812c9374599611b95bcce85a89';
