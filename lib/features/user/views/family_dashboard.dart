import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qareen/cff/core/app_color.dart';
import 'package:qareen/cff/utils/my_scaffold.dart';
import 'package:qareen/cff/utils/page_utils.dart';
import 'package:qareen/cff/utils/ui_helper.dart';
import 'package:qareen/cff/widgets/button/custom_action_button.dart';
import 'package:qareen/cff/widgets/button/custom_button.dart';
import 'package:qareen/cff/widgets/custom_avatar.dart';
import 'package:qareen/cff/widgets/custom_ink_well.dart';
import 'package:qareen/cff/widgets/custom_label.dart';
import 'package:qareen/cff/widgets/logo.dart';
import 'package:qareen/cff/widgets/one_ui/one_ui_nested_scroll_view.dart';
import 'package:qareen/features/auth/models/user.dart';
import 'package:qareen/features/notification/views/notification_view.dart';
import 'package:super_icons/super_icons.dart';

class FamilyDashboard extends StatelessWidget {
  const FamilyDashboard({super.key, required this.user});

  final User? user;

  @override
  Widget build(BuildContext context) {
    final items = [
      {"place": "Masjidil Haram", "time": "Hari ini, 07:45"},
      {"place": "Masjid Nabawi", "time": "Kemarin, 19:20"},
      {"place": "Jabal Uhud", "time": "Kemarin, 08:10"},
    ];
    return MyScaffold(
      customBackground: Container(color: Colors.white),
      child: OneUINestedScrollView(
        boxDecoration: BoxDecoration(color: Colors.white),
        automaticallyImplyLeading: false,
        expandedHeight: 180,
        expandedWidget: Stack(
          children: [
            // Greetings
            Align(
              alignment: Alignment.bottomLeft,
              child: ListView(
                shrinkWrap: true,
                primary: false,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: GestureDetector(
                      onTap: () => context.go('/profile'),
                      child: Column(
                        spacing: 5,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Assalamu'alaikum,").tsTitle(),
                          SizedBox(
                            width: 250,
                            child: Text('Keluarga ${user?.name ?? "Ahmad Fauzi"}').tsHeadline().bold().ellipsis(),
                          ),
                          Text("Semoga selalu dalam lindungan-Nya.").tsTitle(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // LOGO APPS
            SafeArea(
              child: Align(
                alignment: Alignment.topLeft,
                child: Padding(padding: const EdgeInsets.only(left: 20.0, top: 20.0), child: LogoH(height: 40)),
              ),
            ),
            // ACTION BUTTON
            SafeArea(
              child: Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0, right: 10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomActionButton(
                        invertColor: true,
                        actionType: ActionType.notification,
                        hasNotif: true,
                        onPressed: () => context.goto(page: NotificationView()),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        collapsedWidget: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LogoH(height: 40),
              Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: Row(
                  children: [
                    CustomActionButton(
                      invertColor: true,
                      actionType: ActionType.notification,
                      hasNotif: true,
                      onPressed: () => context.goto(page: NotificationView()),
                    ),
                    // CustomAvatar(size: 30, onTap: () => context.go('/profile')),
                  ],
                ),
              ),
            ],
          ),
        ),
        onRefresh: () async => Future.value(),
        sliverList: SliverList.list(
          children: [
            // Jamaah Yang Dipantau,
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: CustomContainerMore(
                title: Text('Jamaah yang Dipantau'),
                textMore: Text('Kelola'),
                child: Column(
                  spacing: 15,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Row(
                              spacing: 10,
                              children: [
                                CustomAvatar(size: 80),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [Text("Ahmad Fauzi").tsTitle().bold(), Text('( Ayah )').tsTitle()],
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("Saat ini di").tsBody(),
                            Text('Masjidil Haram').tsTitle().bold(),
                            CustomLabel('Aman', icon: Icons.check, backgroundColor: Colors.green.shade500),
                          ],
                        ),
                      ],
                    ),
                    divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text('Terakhir Update: Hari ini, 07:45').tsBody(), Icon(Icons.refresh)],
                    ),
                  ],
                ),
              ),
            ),

            // Lokasi Real-time
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: CustomContainerMore(
                title: Text('Lokasi Real-time'),
                textMore: Text('Lihat Peta'),
                child: Container(
                  width: double.infinity,
                  height: 120,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/sample-real-time-location.png'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
            ),

            // Jejak Aman (Check-In)
            10.height,
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: CustomContainerMore(
                title: Text('Jejak Aman (Check-In)'),
                textMore: Text('Lihat Riwayat'),
                child: ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(top: 10, bottom: 0),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final isFirst = index == 0;
                    final isLast = index == items.length - 1;

                    return IntrinsicHeight(
                      child: Row(
                        spacing: 8,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 28,
                            child: Column(
                              children: [
                                Icon(Icons.check_circle, color: isFirst ? Colors.green : Colors.grey),
                                if (!isLast) Expanded(child: Container(width: 3, color: Colors.grey.shade300)),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(top: 2, bottom: !isLast ? 20 : 10),
                              child: Column(
                                spacing: 15,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(child: Text(items[index]["place"]!).tsBody().bold()),
                                      Text(items[index]["time"]!).tsBody(),
                                    ],
                                  ),
                                  if (!isLast) divider(),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),

            // Hubungi & Berkomunikasi
            10.height,
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: CustomContainerMore(
                title: Text('Hubungi & Berkomunikasi'),
                child: GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 10,
                  primary: false,
                  shrinkWrap: true,
                  children: [
                    CustomButton(
                      flat: true,
                      color: Colors.brown,
                      iconPosition: IconPosition.top,
                      child: Text('Chat Jamaah').tsTitle().center(),
                      icon: Icon(SuperIcons.bs_chat_dots_fill).clr(Colors.green).sizex(45),
                      onPressed: () {},
                    ),
                    CustomButton(
                      flat: true,
                      color: Colors.brown,
                      iconPosition: IconPosition.top,
                      child: Text('Telepon Jamaah').tsTitle().center(),
                      icon: Icon(SuperIcons.ev_phone).clr(Colors.green).sizex(45),
                      onPressed: () {},
                    ),
                    CustomButton(
                      flat: true,
                      color: Colors.brown,
                      iconPosition: IconPosition.top,
                      child: Text('Grup Keluarga').tsTitle().center(),
                      icon: Icon(SuperIcons.hr_user_group).clr(Colors.orange).sizex(45),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),

            // Informasi Penting
            10.height,
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: CustomContainerMore(
                title: Text("Informasi Penting"),
                textMore: Text('Lihat Semua'),
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.brown[200]!),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    leading: Icon(Icons.wb_sunny).sizex(45).clr(Colors.orange[300]),
                    title: Text('Cuaca di Makkah hari ini').tsBody(),
                    subtitle: Text('32°C - Cerah').tsHeadline().bold(),
                  ),
                ),
              ),
            ),
            20.height,
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

class MenuItem extends StatelessWidget {
  const MenuItem({super.key, this.icon, this.title, this.onPressed, this.backgroundColor, this.foregroundColor});

  final Widget? icon;
  final Widget? title;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        // color: backgroundColor ?? Color.lerp(primaryLight, Colors.yellow, .5),
        color: backgroundColor,
        child: ListTile(
          // leading: icon == null ? null : (icon as Icon).clr(foregroundColor ?? oWhite),
          // title: title == null ? null : (title as Text).tsBody().clr(foregroundColor ?? oWhite).bold(),
          leading: icon == null
              ? null
              : Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(color: foregroundColor ?? primaryLight, shape: BoxShape.circle),
                  child: (icon as Icon).clr(oWhite),
                ),
          title: title == null ? null : (title as Text).clr(foregroundColor).tsBody().bold(),
        ),
      ),
    );
  }
}

class LastCheckIn extends StatelessWidget {
  const LastCheckIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        decoration: BoxDecoration(color: Colors.amber[50], borderRadius: BorderRadius.circular(16)),
        child: ListTile(
          // isThreeLine: true,
          leading: Icon(Icons.location_history, size: 40),
          title: Text('Jejak Aman').tsTitle().bold(),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Terakhir check-in').tsBody(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('Masjidil Haram').tsBody().bold(), Text('08:45 WIB').tsBody().bold()],
                ),
              ],
            ),
          ),
          trailing: Icon(Icons.chevron_right),
        ),
      ),
    );
  }
}
