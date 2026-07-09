import 'package:flutter/material.dart';
import 'package:qareen/cff/core/app_color.dart';
import 'package:qareen/cff/utils/my_scaffold.dart';
import 'package:qareen/cff/utils/ui_helper.dart';
import 'package:qareen/cff/widgets/button/custom_action_button.dart';
import 'package:qareen/cff/widgets/button/custom_button.dart';
import 'package:qareen/cff/widgets/custom_avatar.dart';
import 'package:qareen/cff/widgets/custom_ink_well.dart';
import 'package:qareen/features/auth/models/user.dart';
import 'package:super_icons/super_icons.dart';

class MuthowwifDashboard extends StatelessWidget {
  const MuthowwifDashboard({super.key, this.user});

  final User? user;

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBar: AppBar(
        toolbarHeight: kToolbarHeight + 20,
        flexibleSpace: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              spacing: 15,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomAvatar(size: 60),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Dashboard Pembimbing').tsHeadline().bold().clr(oWhite),
                    Text('Ust. Abdul Rahman').tsTitle().clr(oWhite),
                  ],
                ),
              ],
            ),
          ),
        ),
        actions: [CustomActionButton(actionType: ActionType.notification, hasNotif: true)],
      ),
      child: Stack(
        children: [
          // Container(height: 60, color: Theme.of(context).appBarTheme.backgroundColor),
          Container(
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).appBarTheme.backgroundColor!,
                  Theme.of(context).appBarTheme.backgroundColor!.withValues(alpha: 0.8),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          ListView(
            children: [
              // Header
              Padding(padding: const EdgeInsets.symmetric(horizontal: 10), child: CustomCard()),

              // Peta Jamaah Real-time
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: CustomContainerMore(
                  title: Text('Peta Jamaah Real-time'),
                  textMore: Text('Lihat Peta Penuh'),
                  child: Column(
                    spacing: 10,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 120,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/sample-real-time-jamaah.png'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      Row(
                        spacing: 15,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomLegend(color: Colors.green, title: 'Sedang Bersama'),
                          CustomLegend(color: Colors.blue, title: 'Terpisah'),
                          CustomLegend(color: Colors.grey, title: 'Belum Check-In'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // Fitur Utama
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: CustomContainerMore(
                  title: Text('Fitur Utama'),
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 10,
                    childAspectRatio: 2.3,
                    primary: false,
                    shrinkWrap: true,
                    children: [
                      CustomButton(
                        flat: true,
                        color: Colors.brown,
                        iconPosition: IconPosition.top,
                        child: Text('Kirim Pengumuman').tsBody().center(),
                        icon: Icon(SuperIcons.mg_announcement_fill).clr(Colors.green).sizex(30),
                        onPressed: () {},
                      ),
                      CustomButton(
                        flat: true,
                        color: Colors.brown,
                        iconPosition: IconPosition.top,
                        child: Text('Jadwal Kegiatan').tsBody().center(),
                        icon: Icon(SuperIcons.mg_calendar_fill).clr(Colors.blue).sizex(30),
                        onPressed: () {},
                      ),
                      CustomButton(
                        flat: true,
                        color: Colors.brown,
                        bgColor: Colors.red.withValues(alpha: .1),
                        iconPosition: IconPosition.top,
                        child: Text('Laporan Darurat').tsBody().center(),
                        icon: Icon(SuperIcons.cl_warning_solid).clr(Colors.red.withValues(alpha: .7)).sizex(30),
                        onPressed: () {},
                      ),
                      CustomButton(
                        flat: true,
                        color: Colors.brown,
                        iconPosition: IconPosition.top,
                        child: Text('Absensi Jamaah').tsBody().center(),
                        icon: Icon(SuperIcons.hr_user_group).clr(Colors.orange).sizex(30),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),

              // Peringatan & Notifikasi
              Padding(padding: const EdgeInsets.only(left: 10, right: 10, top: 10), child: AlertAndNotification()),

              20.height,
            ],
          ),
        ],
      ),
    );
  }
}

class AlertAndNotification extends StatelessWidget {
  const AlertAndNotification({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> items = [
      {
        "type": "warning",
        "note": "Jamaah atas nama Siti Aisyah keluar dari zona aman (Area Masjidil Haram)",
        "time": "08:15",
      },
      {"type": "ok", "note": "Jamaah atas nama H. Umar telah Check-In di Masjidil Haram", "time": "07:30"},
    ];
    return CustomContainerMore(
      title: Text('Peringatan & Notifikasi'),
      textMore: Text('Lihat Semua'),
      child: ListView.builder(
        primary: false,
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          Widget icon = switch (item['type']) {
            'warning' => Icon(Icons.warning_rounded, color: Colors.red, size: 25),
            'ok' => Icon(Icons.check_circle, color: Colors.green, size: 25),
            _ => Icon(Icons.check_circle, color: Colors.green, size: 25),
          };
          return Column(
            spacing: 10,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.only(top: index == 0 ? 0 : 8.0),
                child: Row(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    icon,
                    Expanded(child: Text(item['note']).tsBody()),
                    Text(item['time']).tsCaption(),
                  ],
                ),
              ),
              if (index < items.length - 1) divider(),
            ],
          );
        },
      ),
    );
  }
}

class CustomLegend extends StatelessWidget {
  const CustomLegend({super.key, required this.color, required this.title});

  final Color color;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 7,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        Text(title).tsCaption(),
      ],
    );
  }
}

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          spacing: 10,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text('Rombongan').tsBody(), Text('Al-Hidayah Group').tsTitle().bold()],
                ),
                CustomButton(
                  minWidth: 110,
                  minHeight: 35,
                  child: Text('Lihat Detail'),
                  icon: Icon(Icons.chevron_right),
                  iconPosition: IconPosition.right,
                  onPressed: () {},
                ),
              ],
            ),
            Row(
              spacing: 50,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text('Total Jamaah').tsBody(), Text('45 Orang').tsTitle().bold()],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text('Lokasi Saat Ini').tsBody(), Text('Masjidil Haram').tsTitle().bold()],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomContainerMore extends StatelessWidget {
  const CustomContainerMore({super.key, required this.title, this.textMore, this.child});

  final Widget title;
  final Widget? textMore;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        spacing: 15,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              (title as Text).tsTitle().bold(),
              if (textMore != null)
                CustomInkWell(icon: Icon(Icons.chevron_right), text: (textMore as Text).tsBody().bold(), onTap: () {}),
            ],
          ),
          child ?? Container(),
        ],
      ),
    );
  }
}
