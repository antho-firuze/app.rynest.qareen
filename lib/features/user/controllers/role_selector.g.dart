// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role_selector.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RoleSelector)
final roleSelectorProvider = RoleSelectorProvider._();

final class RoleSelectorProvider
    extends $NotifierProvider<RoleSelector, Role?> {
  RoleSelectorProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'roleSelectorProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$roleSelectorHash();

  @$internal
  @override
  RoleSelector create() => RoleSelector();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Role? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Role?>(value),
    );
  }
}

String _$roleSelectorHash() => r'7abcc7e293d3bbbe8c940a02250346a14763dce4';

abstract class _$RoleSelector extends $Notifier<Role?> {
  Role? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<Role?, Role?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Role?, Role?>,
              Role?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
