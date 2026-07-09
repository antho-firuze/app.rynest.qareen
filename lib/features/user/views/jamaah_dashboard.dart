import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qareen/cff/core/app_color.dart';
import 'package:qareen/cff/utils/my_scaffold.dart';
import 'package:qareen/cff/utils/page_utils.dart';
import 'package:qareen/cff/utils/ui_helper.dart';
import 'package:qareen/cff/widgets/button/custom_action_button.dart';
import 'package:qareen/cff/widgets/custom_avatar.dart';
import 'package:qareen/cff/widgets/custom_ink_well.dart';
import 'package:qareen/cff/widgets/logo.dart';
import 'package:qareen/cff/widgets/one_ui/one_ui_nested_scroll_view.dart';
import 'package:qareen/features/auth/models/user.dart';
import 'package:qareen/features/notification/views/notification_view.dart';
import 'package:qareen/features/user/views/s_o_s_emergency_view.dart';

class JamaahDashboard extends StatelessWidget {
  const JamaahDashboard({super.key, required this.user});

  final User? user;

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      customBackground: Container(color: Colors.white),
      child: OneUINestedScrollView(
        boxDecoration: BoxDecoration(color: Colors.white),
        automaticallyImplyLeading: false,
        expandedHeight: 250,
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
                            width: 150,
                            child: Text('${user?.name ?? "Ahmad Fauzi Mere Tukangs"}').tsHeadline().bold().ellipsis(),
                          ),
                          Text("Semoga ibadah Anda \nlancar dan mabrur.").tsTitle(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // AVATAR
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 65.0),
                child: CustomAvatar(size: 90, onTap: () => context.go('/profile')),
              ),
            ),
            // INFO DATE
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 20.0),
                child: Container(
                  padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 10.0),
                  decoration: BoxDecoration(
                    color: Colors.yellow[50]!.withValues(alpha: .9),
                    border: Border.all(width: 2, color: Colors.yellow[700]!.withValues(alpha: .3)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: IntrinsicWidth(
                    child: IntrinsicHeight(
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Kamis').tsTitle().bold(),
                              Text('23 Mei 2026').tsTitle().bold(),
                              Text("24 Dzulqa'dah 1447 H").tsBody(),
                            ],
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Icon(Icons.sunny, color: Colors.yellow[700]!.withValues(alpha: .7)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
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
        collapsedWidget: Row(
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
                  CustomAvatar(size: 30, onTap: () => context.go('/profile')),
                ],
              ),
            ),
          ],
        ),
        onRefresh: () async => Future.value(),
        sliverList: SliverList.list(
          children: [            
            // Menu
            GridView(
              primary: false,
              shrinkWrap: true,
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.0,
                mainAxisExtent: 65,
              ),
              children: [
                MenuItem(icon: Icon(Icons.schedule_sharp), title: Text('Jadwal Sholat'), foregroundColor: Colors.green),
                MenuItem(
                  icon: Icon(Icons.warning),
                  title: Text('SOS DARURAT'),
                  foregroundColor: Colors.red,
                  onPressed: () => context.goto(page: SOSEmergencyView()),
                ),
                MenuItem(icon: Icon(Icons.menu_book_sharp), title: Text('Panduan Umroh'), foregroundColor: Colors.blue),
                MenuItem(icon: Icon(Icons.navigation), title: Text('Navigasi'), foregroundColor: Colors.purple),
              ],
            ),

            // Jejak Aman (Check-In)
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: CustomContainerMore(
                title: Text('Jejak Aman (Check-In)'),
                textMore: Text('Lihat Riwayat'),
                child: Row(
                  spacing: 10,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(color: Colors.green[100], borderRadius: BorderRadius.circular(12)),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Terakhir Check-In").tsTitle(),
                        Text('Masjidil Haram').tsTitle().bold(),
                        Text("Hari ini, 07:45").tsTitle(),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Navigasi & Kerumunan
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: CustomContainerMore(
                title: Text('Navigasi & Kerumunan'),
                textMore: Text('Lihat Peta'),
                child: Container(
                  width: double.infinity,
                  height: 120,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/sample-real-time-traffic.png'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
            ),

            // Pengingat Ibadah
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: CustomContainerMore(
                title: Text('Pengingat Ibadah'),
                textMore: Text('Lihat Semua'),
                child: Row(
                  spacing: 10,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(color: Colors.green[100], borderRadius: BorderRadius.circular(12)),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Anda berada di Area Roudhah').tsTitle().bold(),
                        Text("Perbanyak Do'a dan Dzikir").tsTitle(),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Doa Harian
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: CustomContainerMore(
                title: Text("Do'a Harian"),
                textMore: Text('Lihat Semua'),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Anda berada di Area Roudhah').tsTitle().bold(),
                    Text("Perbanyak Do'a dan Dzikir").tsTitle(),
                  ],
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
