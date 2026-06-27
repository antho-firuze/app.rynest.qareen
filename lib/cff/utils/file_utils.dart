import 'dart:developer';
import 'dart:io';

import 'package:flutter_archive/flutter_archive.dart';
import 'package:path/path.dart';
import 'package:qareen/cff/models/reqs.dart';
import 'package:qareen/cff/utils/log_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';

import 'dio_service.dart';
import 'path_service.dart';

final fetchImageProvider = FutureProvider.autoDispose.family<String, Reqs>(
  (ref, arguments) async => await ref.read(fileUtilsProvider).downloadAndSaveImage(arguments.url!, arguments.fileKey),
);

final fileUtilsProvider = Provider(FileUtils.new);

class FileUtils {
  final Ref ref;
  FileUtils(this.ref);

  final _kLogName = "FILE-UTILS";

  Future<String> saveAssetOnDisk(ImageProvider image, String fileName) async {
    Directory directory = await getApplicationDocumentsDirectory();
    String filePath = '${directory.path}/$fileName';
    File newFile = File(filePath);

    if (!await newFile.exists()) {
      // BitmapHelper bitmapHelper = await BitmapHelper.fromImageProvider(image);
      // await newFile.writeAsBytes(bitmapHelper.content);
    }

    return filePath;
  }

  Future deleteImageOndisk(String fileName, {bool showLog = true}) async {
    try {
      var directory = await ref.read(pathServiceProvider).getAppFileDirectory();
      var file = File('$directory/$fileName');

      if (await file.exists()) {
        if (showLog) logX('deleteImageOndisk [file.path] : ${file.path}', name: _kLogName);
        await file.delete();
      } else {
        if (showLog) logX('deleteImageOndisk [$fileName] : not exist !', name: _kLogName);
      }
    } catch (e) {
      logE("Error: deleteImageOndisk", error: e, name: _kLogName);
      rethrow;
    }
  }

  Future<String> downloadAndSaveImage(String repoUrl, String fileName, {bool showLog = false}) async {
    try {
      var directory = await ref.read(pathServiceProvider).getAppFileDirectory();
      var file = File('$directory/$fileName');

      if (await file.exists()) {
        if (showLog) logX('downloadAndSaveImage [file.path] : ${file.path}', name: _kLogName);
        return file.path;
      }

      if (showLog) logX('downloadAndSaveImage [$fileName] : downloading...!', name: _kLogName);
      final url = Uri.parse(repoUrl);
      final response = await ref
          .read(dioFileDownloadProvider)
          .getUri(
            url,
            onReceiveProgress: (count, total) {
              if (total != -1) {
                log((count / total * 100).toStringAsFixed(0) + "%");
              }
            },
          );

      if (response.statusCode != 200) {
        throw Exception('Image not available !');
      }

      var fo = file.openSync(mode: FileMode.write);
      fo.writeFromSync(response.data);
      await fo.close();
      if (showLog) logX('downloadAndSaveImage [$fileName] : download complete !', name: _kLogName);
      return file.path;
    } catch (e, st) {
      if (e is DioException) {
        final errCode = e.response?.statusCode;
        final errMsg = e.response?.statusMessage;

        logE("[$errCode] $errMsg", error: e, stackTrace: st, name: _kLogName);
      } else {
        logE("Error: downloadAndSaveImage", error: e, stackTrace: st, name: _kLogName);
      }
      rethrow;
    }
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

  Future<bool> extractZipFile({required String filePath, required String directory, void Function(double percent)? callBack}) async {
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

String fileSize(dynamic size, [int round = 2]) {
  /**
   * [size] can be passed as number or as string
   *
   * the optional parameter [round] specifies the number
   * of digits after comma/point (default is 2)
   */
  int divider = 1024;
  // ignore: no_leading_underscores_for_local_identifiers
  int _size;
  try {
    _size = int.parse(size.toString());
  } catch (e) {
    throw ArgumentError("Can not parse the size parameter: $e");
  }

  if (_size < divider) {
    return "$_size B";
  }

  if (_size < divider * divider && _size % divider == 0) {
    return "${(_size / divider).toStringAsFixed(0)} KB";
  }

  if (_size < divider * divider) {
    return "${(_size / divider).toStringAsFixed(round)} KB";
  }

  if (_size < divider * divider * divider && _size % divider == 0) {
    return "${(_size / (divider * divider)).toStringAsFixed(0)} MB";
  }

  if (_size < divider * divider * divider) {
    return "${(_size / divider / divider).toStringAsFixed(round)} MB";
  }

  if (_size < divider * divider * divider * divider && _size % divider == 0) {
    return "${(_size / (divider * divider * divider)).toStringAsFixed(0)} GB";
  }

  if (_size < divider * divider * divider * divider) {
    return "${(_size / divider / divider / divider).toStringAsFixed(round)} GB";
  }

  if (_size < divider * divider * divider * divider * divider && _size % divider == 0) {
    num r = _size / divider / divider / divider / divider;
    return "${r.toStringAsFixed(0)} TB";
  }

  if (_size < divider * divider * divider * divider * divider) {
    num r = _size / divider / divider / divider / divider;
    return "${r.toStringAsFixed(round)} TB";
  }

  if (_size < divider * divider * divider * divider * divider * divider && _size % divider == 0) {
    num r = _size / divider / divider / divider / divider / divider;
    return "${r.toStringAsFixed(0)} PB";
  } else {
    num r = _size / divider / divider / divider / divider / divider;
    return "${r.toStringAsFixed(round)} PB";
  }
}
