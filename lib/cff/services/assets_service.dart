import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:html/parser.dart';
import 'package:qareen/cff/utils/dio_service.dart';
import 'package:qareen/cff/utils/log_utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'assets_service.g.dart';

// GITHUB RELEASES for ASSETS RESOURCES
// STATUS: PENDING
// INFO: Menggunakan API Github sudah berhasil hanya keterbatasan oleh rate-limit, 
//       alternatif menggunakan web crawler, tapi belum sampai selesai.

@riverpod
AssetsService assetsService(Ref ref) => AssetsService(ref);

class AssetsService {
  AssetsService(this.ref);
  Ref ref;

  final _kLogName = 'ASSETS-SVC';

  final githubOwner = 'antho-firuze';
  final githubRepo = 'qorin_assets';
  final githubAssetsName = 'quran-assets.zip';
  final githubCurrVersion = 'v1.0.0';

  // final _assetsUrl = 'https://github.com/antho-firuze/qorin_assets/releases/download/v1.0.0/quran-assets.zip';

  // Alternative using Web Url while API Url is throw by rate limiting
  Future<String?> getLatestAssetsUrl() async {
    try {
      final url = 'https://github.com/$githubOwner/$githubRepo/releases/latest';

      final res = await ref.read(dioProvider).get(url);
      if (res.statusCode != 200) {
        throw Exception('[${res.statusCode}] Can\'t find repo: $url');
      }

      final doc = parse(res.data);
      final ver = doc.querySelector('#repo-content-turbo-frame > div > div > div > div.Box-body > div.tmp-mb-3.tmp-pb-md-4.border-md-bottom > div > div:nth-child(2) > a > span > span')?.outerHtml;
      logX('ver: $ver', name: _kLogName);

      // Supports 1.2.3 (most of the apps) and 1.2.prod.3 (e.g. Google Cloud)
      final regexp = RegExp(r'\[\[\[\"(\d+\.\d+(\.[a-z]+)?(\.([^"]|\\")*)?)\"\]\]');
      final latestVersion = regexp.firstMatch(res.data)?.group(1);
      logD('Latest assets: $latestVersion', name: _kLogName);

      // final tagName = doc['tag_name'];
      // final assetsName = doc['assets'][0]['name'];
      // final latestAssetsUrl = 'https://github.com/$githubOwner/$githubRepo/releases/download/$tagName/$assetsName';
      // logD('Latest assets: $latestAssetsUrl', name: _kLogName);

      // Compare Version
      // final latestVer = _getCleanVersion(tagName);
      // final currentVer = _getCleanVersion(githubCurrVersion);
      // logD('Latest: $latestVer vs Current: $currentVer', name: _kLogName);

      // return latestAssetsUrl;
    } catch (e, s) {
      logE('checkNewAssets: ', error: e, stackTrace: s, name: _kLogName);
    }
  }

  // Using API Url is throw by rate limiting
  // Future<String?> getLatestAssetsUrl() async {
  //   try {
  //     final url = 'https://api.github.com/repos/$githubOwner/$githubRepo/releases/latest';

  //     final res = await ref.read(dioProvider).get(url);
  //     if (res.statusCode != 200) {
  //       throw Exception('[${res.statusCode}] Can\'t find repo: $url');
  //     }

  //     Map<String, dynamic> map = res.data;

  //     final tagName = map['tag_name'];
  //     final assetsName = map['assets'][0]['name'];
  //     final latestAssetsUrl = 'https://github.com/$githubOwner/$githubRepo/releases/download/$tagName/$assetsName';

  //     logD('Latest assets: $latestAssetsUrl', name: _kLogName);

  //     // Compare Version
  //     final latestVer = _getCleanVersion(tagName);
  //     final currentVer = _getCleanVersion(githubCurrVersion);

  //     logD('Latest: $latestVer vs Current: $currentVer', name: _kLogName);

  //     return latestAssetsUrl;
  //   } catch (e, s) {
  //     logE('checkNewAssets: ', error: e, stackTrace: s, name: _kLogName);
  //   }
  // }

  /// This function attempts to clean local version strings so they match the MAJOR.MINOR.PATCH
  /// versioning pattern, so they can be properly compared with the store version.
  String _getCleanVersion(String version) => RegExp(r'\d+\.\d+\.\d+').stringMatch(version) ?? '0.0.0';
}
