import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qareen/cff/core/app_color.dart';
import 'package:qareen/cff/utils/my_scaffold.dart';
import 'package:qareen/cff/utils/ui_helper.dart';

class DownloadAssetWidget extends ConsumerWidget {
  const DownloadAssetWidget({super.key, required this.progress, required this.title});

  final double progress;
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MyScaffold(
      appBar: AppBar(title: const Text("Al-Qur'an")),
      child: title.isEmpty
          ? SizedBox()
          : Center(
              child: Column(
                spacing: 30,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.download, size: 100),
                  Text('Sedang melengkapi asset Al-Quran').tsBody(),
                  SizedBox(
                    width: 250,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        LinearProgressIndicator(
                          value: progress / 100,
                          valueColor: const AlwaysStoppedAnimation<Color>(oGold200),
                        ),
                        Text(title).tsBody(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
