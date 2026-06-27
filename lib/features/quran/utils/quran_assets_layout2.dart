// ignore_for_file: riverpod_lint/avoid_public_notifier_properties
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qareen/cff/services/sharedpref_service.dart';
import 'package:qareen/cff/utils/log_utils.dart';
import 'package:qareen/features/quran/utils/assets_helper.dart';
import 'package:qareen/features/quran/utils/file_utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quran_assets_layout2.g.dart';

final _kLogName = "QURAN-ASSETS-LAYOUT-2";

@Riverpod(keepAlive: true)
class QuranAssetsLayout2 extends _$QuranAssetsLayout2 {
  String appPath = '';
  double progressPercentage = 0.0;
  String progressName = '';

  @override
  bool build() => false;

  Future initialize() async {
    // Get app support path
    appPath = await _getAppPath();
    logD('App path: $appPath', name: _kLogName);

    await _checkIsAssetsReady(
      url: chaptersUrl,
      destinationPath: appPath,
      assetName: 'chapters',
      expected: 114,
      sharedPrefkey: chaptersKey,
      newVersion: chaptersVersion,
    );
    await _checkIsAssetsReady(
      url: dataUrl,
      destinationPath: appPath,
      assetName: 'data',
      expected: 1,
      sharedPrefkey: dataKey,
      newVersion: dataVersion,
    );
    await _checkIsAssetsReady(
      url: pagesUrl,
      destinationPath: appPath,
      assetName: 'pages',
      expected: 604,
      sharedPrefkey: pagesKey,
      newVersion: pagesVersion,
    );

    state = true;
  }

  Future<String> _getAppPath() async {
    final _appDir = await getApplicationSupportDirectory();
    return _appDir.path;
  }

  Future _checkIsAssetsReady({
    required String url,
    required String destinationPath,
    required String assetName,
    required int expected,
    required String sharedPrefkey,
    required String newVersion,
  }) async {
    String _assetsDir = join(destinationPath, assetName);

    // Check is file exists
    bool _isFileOK = await ref.read(fileUtilsProvider).checkFileExpected(_assetsDir, expected);
    if (!_isFileOK) {
      String _fileDownloaded = await ref
          .read(fileUtilsProvider)
          .downloadFile(
            url: url,
            callBack: (percent) {
              progressPercentage = percent;
              progressName = 'Downloading $assetName';
              // logX('Download progress: ${progressPercentage.toStringAsFixed(0)} %', name: _kLogName);
              ref.notifyListeners();
            },
          );
      if (_fileDownloaded.isNotEmpty) {
        bool _fileExtracted = await ref
            .read(fileUtilsProvider)
            .extractZipFile(
              filePath: _fileDownloaded,
              directory: destinationPath,
              callBack: (percent) {
                progressPercentage = percent;
                progressName = 'Extracting $assetName';
                // logX('Extracting progress: ${progressPercentage.toStringAsFixed(0)} %', name: _kLogName);
                ref.notifyListeners();
              },
            );
        if (_fileExtracted) {
          // After extracted re-check the file again
          await ref.read(fileUtilsProvider).checkFileExpected(_assetsDir, expected);
        }
      }
    } else {
      // While file exists, check whenever new version is grather than current version
      // get current version from shared preference
      String oldVersion = await ref.read(sharedPrefProvider).getString(sharedPrefkey) ?? '0.0.0';
      if (_isNewVersionAvailable(newVersion, oldVersion)) {
        String _fileDownloaded = await ref
            .read(fileUtilsProvider)
            .downloadFile(
              url: url,
              callBack: (percent) {
                progressPercentage = percent;
                progressName = 'Downloading $assetName';
                // logX('Download progress: ${progressPercentage.toStringAsFixed(0)} %', name: _kLogName);
                ref.notifyListeners();
              },
            );
        if (_fileDownloaded.isNotEmpty) {
          bool _fileExtracted = await ref
              .read(fileUtilsProvider)
              .extractZipFile(
                filePath: _fileDownloaded,
                directory: destinationPath,
                callBack: (percent) {
                  progressPercentage = percent;
                  progressName = 'Extracting $assetName';
                  // logX('Extracting progress: ${progressPercentage.toStringAsFixed(0)} %', name: _kLogName);
                  ref.notifyListeners();
                },
              );
          if (_fileExtracted) {
            // After extracted re-check the file again
            await ref.read(fileUtilsProvider).checkFileExpected(_assetsDir, expected);
          }
        }
        logD('Assets (Updated): $_assetsDir', name: _kLogName);
      } else {
        logD('Assets (Ready): $_assetsDir', name: _kLogName);
      }
    }

    // Save current version assets
    await ref.read(sharedPrefProvider).setString(sharedPrefkey, newVersion);
  }

  // format version => 1.0.0
  bool _isNewVersionAvailable(String newVer, String oldVer) {
    double _newVer = double.tryParse(newVer.replaceAll(RegExp(r'[.]'), '')) ?? 0.0;
    double _oldVer = double.tryParse(oldVer.replaceAll(RegExp(r'[.]'), '')) ?? 0.0;
    return _newVer > _oldVer;
  }
}
