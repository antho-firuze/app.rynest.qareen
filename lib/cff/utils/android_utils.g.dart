// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'android_utils.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(androidUtil)
final androidUtilProvider = AndroidUtilProvider._();

final class AndroidUtilProvider
    extends $FunctionalProvider<AndroidUtil, AndroidUtil, AndroidUtil>
    with $Provider<AndroidUtil> {
  AndroidUtilProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'androidUtilProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$androidUtilHash();

  @$internal
  @override
  $ProviderElement<AndroidUtil> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AndroidUtil create(Ref ref) {
    return androidUtil(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AndroidUtil value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AndroidUtil>(value),
    );
  }
}

String _$androidUtilHash() => r'3d8a1fc4f29e099e8490a8224b109e29396c8be6';
