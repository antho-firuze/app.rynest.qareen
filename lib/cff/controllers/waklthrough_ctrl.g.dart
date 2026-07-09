// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'waklthrough_ctrl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Waklthrough)
final waklthroughProvider = WaklthroughProvider._();

final class WaklthroughProvider
    extends
        $FunctionalProvider<WaklthroughCtrl, WaklthroughCtrl, WaklthroughCtrl>
    with $Provider<WaklthroughCtrl> {
  WaklthroughProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'waklthroughProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$waklthroughHash();

  @$internal
  @override
  $ProviderElement<WaklthroughCtrl> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  WaklthroughCtrl create(Ref ref) {
    return Waklthrough(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WaklthroughCtrl value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WaklthroughCtrl>(value),
    );
  }
}

String _$waklthroughHash() => r'8e54483b29510d0a887c2bf141e02e24f6e4bd09';
