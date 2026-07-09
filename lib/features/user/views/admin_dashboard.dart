import 'package:flutter/material.dart';
import 'package:qareen/cff/core/app_color.dart';
import 'package:qareen/cff/utils/my_scaffold.dart';
import 'package:qareen/cff/utils/ui_helper.dart';
import 'package:qareen/cff/widgets/button/custom_action_button.dart';
import 'package:qareen/cff/widgets/button/custom_button.dart';
import 'package:qareen/cff/widgets/custom_avatar.dart';
import 'package:qareen/cff/widgets/custom_combo.dart';
import 'package:qareen/cff/widgets/custom_ink_well.dart';
import 'package:qareen/features/auth/models/user.dart';
import 'package:super_icons/super_icons.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key, this.user});

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
                    Text('Dashboard Petugas Travel').tsHeadline().bold().clr(oWhite),
                    Text('PT. Travel Indonesia').tsTitle().clr(oWhite),
                  ],
                ),
              ],
            ),
          ),
        ),
        actions: [CustomActionButton(actionType: ActionType.notification, hasNotif: true)],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: CustomCombo(filled: true, isRoudedBorder: true),
          ),
        ),
      ),
      child: Stack(
        children: [
          Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [primaryLight, primaryLight.withValues(alpha: 0.8)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Positioned.fill(
            // top: 25,
            child: Container(
              decoration: BoxDecoration(
                color: oWhite,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: ListView(
              children: [
                // Counter Value
                Padding(padding: const EdgeInsets.only(left: 5, right: 5), child: DashboardSummary()),

                // Status Operational
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: CustomContainerMore(
                    title: Text('Status Operasional'),
                    textMore: Text('Lihat Detail'),
                    child: GridView.count(
                      crossAxisCount: 4,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 10,
                      childAspectRatio: .9.whenLandscape(2)!,
                      primary: false,
                      shrinkWrap: true,
                      children: [
                        CustomButton(
                          flat: true,
                          iconPosition: IconPosition.top,
                          child: Text('Manajemen Rombongan').tsBody().center(),
                          icon: Icon(SuperIcons.hr_user_group).clr(Colors.deepPurple).sizex(30),
                          onPressed: () {},
                        ),
                        CustomButton(
                          flat: true,
                          iconPosition: IconPosition.top,
                          child: Text('Hotel & Transportasi').tsBody().center(),
                          icon: Icon(SuperIcons.mg_announcement_fill).clr(Colors.deepPurple).sizex(30),
                          onPressed: () {},
                        ),
                        CustomButton(
                          flat: true,
                          iconPosition: IconPosition.top,
                          child: Text('Perizinan & Dokumen').tsBody().center(),
                          icon: Icon(SuperIcons.mg_calendar_fill).clr(Colors.deepPurple).sizex(30),
                          onPressed: () {},
                        ),
                        CustomButton(
                          flat: true,
                          iconPosition: IconPosition.top,
                          child: Text('Keuangan').tsBody().center(),
                          icon: Icon(SuperIcons.cl_warning_solid).clr(Colors.brown).sizex(30),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),

                // Peta Monitoring Keseluruhan
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: CustomContainerMore(
                    title: Text('Peta Monitoring Keseluruhan'),
                    textMore: Text('Lihat Peta'),
                    child: Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/sample-real-time-monitoring.png'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                  ),
                ),

                // Laporan & Aktifitas
                Padding(padding: const EdgeInsets.only(left: 10, right: 10, top: 10), child: AlertAndNotification()),

                20.height,
              ],
            ),
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
      {"type": "warning", "note": "Laporan Darurat Baru dari Rombongan Al-Hidayah (Butuh Penanganan)", "time": "09:10"},
      {"type": "ok", "note": "Rombongan Baitullah tiba di Hotel Makkah Tower", "time": "08:40"},
      {"type": "announce", "note": "Pengumuman terkirim ke semua rombongan", "time": "08:15"},
    ];
    return CustomContainerMore(
      title: Text('Laporan & Aktifitas'),
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
            _ => Icon(SuperIcons.mg_announcement_fill, color: Colors.purple, size: 25),
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

class DashboardSummary extends StatelessWidget {
  const DashboardSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: GridView.count(
        primary: false,
        shrinkWrap: true,
        crossAxisCount: 4,
        // padding: EdgeInsets.only(bottom: 5),
        childAspectRatio: 1.whenLandscape(1.9)!,
        children: [
          SummaryItem(title: 'Total Rombongan', value: '8'),
          SummaryItem(title: 'Total Jamaah', value: '326'),
          SummaryItem(
            title: 'Jamaah Aktif',
            value: '312',
            valueColor: Colors.green,
            subtitle: '95.7%',
            subtitleColor: Colors.green,
          ),
          SummaryItem(
            title: 'Laporan Darurat',
            value: '2',
            valueColor: Colors.red,
            subtitle: 'Perlu Tindak Lanjut',
            subtitleColor: Colors.red,
            showDivider: false,
          ),
        ],
      ),
    );
  }
}

class SummaryItem extends StatelessWidget {
  const SummaryItem({
    super.key,
    required this.title,
    required this.value,
    this.valueColor,
    this.subtitle,
    this.subtitleColor,
    this.showDivider = true,
  });

  final String title;
  final String value;
  final Color? valueColor;
  final String? subtitle;
  final Color? subtitleColor;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Container(
        decoration: BoxDecoration(
          border: showDivider ? Border(right: BorderSide(color: Colors.grey)) : null,
        ),
        child: Column(
          spacing: 7,
          mainAxisSize: MainAxisSize.min,
          children: [
            FittedBox(fit: BoxFit.scaleDown, child: Text(title).center()),
            Text(value).tsHeadline().bold().clr(valueColor),
            if (subtitle != null) FittedBox(fit: BoxFit.scaleDown, child: Text(subtitle!).tsBody().clr(subtitleColor)),
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
