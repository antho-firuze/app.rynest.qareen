// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(checkDataAvailable)
final checkDataAvailableProvider = CheckDataAvailableProvider._();

final class CheckDataAvailableProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, Stream<bool>>
    with $FutureModifier<bool>, $StreamProvider<bool> {
  CheckDataAvailableProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'checkDataAvailableProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$checkDataAvailableHash();

  @$internal
  @override
  $StreamProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<bool> create(Ref ref) {
    return checkDataAvailable(ref);
  }
}

String _$checkDataAvailableHash() =>
    r'83ee35d6cac3a7c396f370bd0399744a04eb8610';

@ProviderFor(CheckDataConnection)
final checkDataConnectionProvider = CheckDataConnectionProvider._();

final class CheckDataConnectionProvider
    extends $NotifierProvider<CheckDataConnection, bool> {
  CheckDataConnectionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'checkDataConnectionProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$checkDataConnectionHash();

  @$internal
  @override
  CheckDataConnection create() => CheckDataConnection();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$checkDataConnectionHash() =>
    r'445c70ae86e91d4501d72ecc84b705f8dabd739e';

abstract class _$CheckDataConnection extends $Notifier<bool> {
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
