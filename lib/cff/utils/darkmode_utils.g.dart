// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'darkmode_utils.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MyThemeMode)
final myThemeModeProvider = MyThemeModeProvider._();

final class MyThemeModeProvider
    extends $NotifierProvider<MyThemeMode, ThemeMode> {
  MyThemeModeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'myThemeModeProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$myThemeModeHash();

  @$internal
  @override
  MyThemeMode create() => MyThemeMode();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ThemeMode value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ThemeMode>(value),
    );
  }
}

String _$myThemeModeHash() => r'bed096ec4d2e7ba63f30edae48f02334da538c9e';

abstract class _$MyThemeMode extends $Notifier<ThemeMode> {
  ThemeMode build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ThemeMode, ThemeMode>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ThemeMode, ThemeMode>,
              ThemeMode,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
