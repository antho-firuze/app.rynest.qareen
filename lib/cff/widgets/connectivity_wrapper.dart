import 'package:qareen/cff/services/dialog_service.dart';
import 'package:qareen/cff/services/network_service.dart';
import 'package:qareen/cff/widgets/forms/ordered_list.dart';
import 'package:qareen/cff/widgets/overlay_container.dart';
import 'package:qareen/cff/core/app_color.dart';
import 'package:qareen/cff/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConnectivityWrapper extends ConsumerWidget {
  const ConnectivityWrapper({
    super.key,
    this.child,
    this.enabled = true,
    this.caption = 'Koneksi internet anda terganggu !',
  });

  final bool enabled;
  final Widget? child;
  final String caption;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isShowOverlay = ref.watch(checkDataConnectionProvider) == false;

    if (!enabled) {
      isShowOverlay = false;
    }

    return Material(
      child: Stack(
        children: [
          child ?? const SizedBox(),
          SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () async {
                  return DialogService(
                    title: Text('Informasi'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 10,
                      children: [
                        Text('Kenapa koneksi internet saya terganggu?'),
                        OrderedList(
                          title: Text('Silahkan cek beberapa hal berikut ini :'),
                          children: [
                            Text('Pastikan perangkat anda tidak dalam mode pesawat.'),
                            Text('Pastikan anda terhubung dengan WiFi (Access Point) yang memiliki akses internet.'),
                            Text('Pastikan paket data anda, kuota dan masa berlakunya masih aktif.'),
                            Text('Pastikan sinyal WiFi atau sinyal provider bagus (diatas 2 bar).'),
                          ],
                        ),
                      ],
                    ),
                  ).showOk();
                },
                child: OverlayContainer(
                  isShowOverlay: isShowOverlay,
                  backgroundColor: oRed.withValues(alpha: .8),
                  child: SizedBox(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.wifi_off, color: oWhite),
                        10.width,
                        Text('Koneksi internet anda terganggu !').tsBody().clr(oWhite),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
