// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_utils.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(fileUtils)
final fileUtilsProvider = FileUtilsProvider._();

final class FileUtilsProvider
    extends $FunctionalProvider<FileUtils, FileUtils, FileUtils>
    with $Provider<FileUtils> {
  FileUtilsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fileUtilsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fileUtilsHash();

  @$internal
  @override
  $ProviderElement<FileUtils> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  FileUtils create(Ref ref) {
    return fileUtils(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FileUtils value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FileUtils>(value),
    );
  }
}

String _$fileUtilsHash() => r'5c1f41af04a64dee9542587a839a8a4218d251f6';
