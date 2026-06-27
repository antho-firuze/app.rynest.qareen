// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quran_setting.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(quranSetting)
final quranSettingProvider = QuranSettingProvider._();

final class QuranSettingProvider
    extends $FunctionalProvider<QuranSetting, QuranSetting, QuranSetting>
    with $Provider<QuranSetting> {
  QuranSettingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'quranSettingProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$quranSettingHash();

  @$internal
  @override
  $ProviderElement<QuranSetting> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  QuranSetting create(Ref ref) {
    return quranSetting(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(QuranSetting value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<QuranSetting>(value),
    );
  }
}

String _$quranSettingHash() => r'df68786d6f7f747946131553cfac08226460be79';
