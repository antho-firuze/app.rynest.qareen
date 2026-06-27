// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'label_selector.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LabelSelector)
final labelSelectorProvider = LabelSelectorProvider._();

final class LabelSelectorProvider
    extends $NotifierProvider<LabelSelector, List<String>> {
  LabelSelectorProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'labelSelectorProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$labelSelectorHash();

  @$internal
  @override
  LabelSelector create() => LabelSelector();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<String>>(value),
    );
  }
}

String _$labelSelectorHash() => r'06f43903a506fc67eb72861385fdcbb2a762177b';

abstract class _$LabelSelector extends $Notifier<List<String>> {
  List<String> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<String>, List<String>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<String>, List<String>>,
              List<String>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
