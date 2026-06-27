import 'dart:io';

import 'package:flutter_archive/flutter_archive.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qareen/cff/utils/dio_service.dart';
import 'package:qareen/cff/utils/file_utils.dart';
import 'package:qareen/cff/utils/log_utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'file_utils.g.dart';

final _kLogName = "FILE-UTILS";

@Riverpod(keepAlive: true)
FileUtils fileUtils(Ref ref) => FileUtils(ref);

class FileUtils {
  FileUtils(this.ref);
  Ref ref;

  Future<bool> checkFileExpected(String dirPath, int expect, [bool showFile = false]) async {
    if (!await Directory(dirPath).exists()) {
      logD('Directory (not exists): $dirPath', name: _kLogName);
      return false;
    }

    final List<FileSystemEntity> _entities = await Directory(dirPath).list().toList();
    if (showFile) {
      for (var file in _entities) {
        logX(file.path, name: _kLogName);
      }
    }
    final _count = _entities.whereType<File>().length;
    if (_count < expect) {
      logD('Directory (exists): $dirPath [$_count files, expected $expect files]', name: _kLogName);
      return false;
    }
    logD('Directory (exists): $dirPath [$_count files, expected $expect files]', name: _kLogName);
    return true;
  }

  Future<String> downloadFile({
    required String url,
    String? saveFilePath,
    void Function(double percent)? callBack,
  }) async {
    try {
      final _tempDir = await getTemporaryDirectory();
      final tempPath = _tempDir.path;
      String _tempFile = saveFilePath ?? join(tempPath, 'tempfile');

      // DOWNLOAD
      final response = await ref
          .read(dioFileDownloadProvider)
          .download(
            url,
            _tempFile,
            onReceiveProgress: (count, total) {
              if (total != -1) {
                callBack?.call((count / total * 100));
              }
            },
          );
      if (response.statusCode == 302) {
        String? redirectUrl = response.headers.value('location');

        if (redirectUrl != null) {
          // Lakukan unduhan ulang ke URL tujuan yang baru
          await ref
              .read(dioFileDownloadProvider)
              .download(
                redirectUrl,
                _tempFile,
                onReceiveProgress: (count, total) {
                  if (total != -1) {
                    callBack?.call((count / total * 100));
                  }
                },
              );
          logD("Download selesai dari lokasi redirect !", name: _kLogName);
        }
      } else if (response.statusCode == 200) {
        logD("Download selesai !", name: _kLogName);
      }

      // Check downloaded file
      final filesize = await File(_tempFile).lengthSync();
      logD('File downloaded: $_tempFile \nFile size: ${fileSize(filesize)}', name: _kLogName);

      return _tempFile;
    } catch (e, s) {
      logE('File download:', error: e, stackTrace: s, name: _kLogName);
      return '';
    }
  }

  Future<bool> extractZipFile({
    required String filePath,
    required String directory,
    void Function(double percent)? callBack,
  }) async {
    try {
      // Extract the file
      logD("Extracting file", name: _kLogName);
      await ZipFile.extractToDirectory(
        zipFile: File(filePath),
        destinationDir: Directory(directory),
        onExtracting: (zipEntry, progress) {
          callBack?.call(progress);
          return ZipFileOperation.includeItem;
        },
      );
      // Clean the garbage
      await File(filePath).delete();

      logD("File extracted !", name: _kLogName);

      return true;
    } catch (e, s) {
      logE('extractZipFile:', error: e, stackTrace: s, name: _kLogName);
      return false;
    }
  }
}
