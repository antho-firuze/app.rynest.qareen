import 'package:qareen/cff/controllers/permission_ctrl.dart';
import 'package:qareen/cff/utils/darkmode_utils.dart';
import 'package:qareen/cff/utils/my_scaffold.dart';
import 'package:qareen/cff/utils/page_utils.dart';
import 'package:qareen/cff/widgets/button/custom_action_button.dart';
import 'package:qareen/cff/widgets/button/darkmode_button.dart';
import 'package:qareen/cff/widgets/custom_appbar_background.dart';
import 'package:qareen/cff/widgets/custom_background.dart';
import 'package:qareen/cff/widgets/logo.dart';
import 'package:qareen/cff/widgets/logo/app_logo.dart';
import 'package:qareen/features/auth/controllers/auth_controller.dart';
import 'package:qareen/features/notification/views/notification_view.dart';
import 'package:qareen/features/user/views/widgets/product_widget.dart';
import 'package:qareen/features/user/views/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:super_icons/super_icons.dart';
import 'package:qareen/cff/widgets/button/custom_iconbutton.dart';
import 'package:qareen/cff/widgets/custom_avatar.dart';
import 'package:qareen/cff/widgets/one_ui/one_ui_nested_scroll_view.dart';
import 'package:qareen/cff/core/app_color.dart';
import 'package:qareen/features/user/views/widgets/menu_widget.dart';
import 'package:qareen/cff/utils/my_ui.dart';
import 'package:qareen/cff/utils/ui_helper.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  static const routeName = '/home';

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ref.read(permissionCtrlProvider).initialize();
    });
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        ref.read(permissionCtrlProvider).initialize();
      });
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(authCtrlProvider).value;
    // return MyScaffold(
    //   // customBackground: Container(color: oGold),
    //   // customBackground: CustomBackground(),
    //   // customAppBar: CustomAppBarBackground(),
    //   // customAppBar: Container(color: oGold),
    //   // appBarColor: oGold,
    //   // backgroundColor: oGold,
    //   // appBar: AppBar(
    //   //   titleSpacing: 20,
    //   //   title: Text('Home'),
    //   //   shape: BeveledRectangleBorder(borderRadius: BorderRadiusGeometry.only(bottomRight: Radius.circular(25))),
    //   // ),
    //   child: Container(child: DarkModeButton(forAppBar: false)),
    // );

    return MyScaffold(
      // enabledSafeArea: false,
      customBackground: Container(color: Colors.white),
      // statusBarColor: Colors.transparent,
      // appBarColor: Colors.white,
      child: OneUINestedScrollView(
        // background: Container(color: Colors.transparent),
        boxDecoration: BoxDecoration(color: Colors.white),

        automaticallyImplyLeading: false,
        // sliverBackgroundColor: primaryLight,
        expandedHeight: 140,
        expandedWidget: Stack(
          children: [
            SafeArea(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Row(
                      spacing: 15,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomAvatar(size: 70, onTap: () => context.go('/profile')),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => context.go('/profile'),
                            child: Column(
                              spacing: 5,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("Assalamu'alaikum,").tsTitle(),
                                Text('${user?.name ?? "Guest"}').tsHeadline().bold().ellipsis(),
                                Text("Semoga ibadah Anda \nlancar dan mabrur.").tsTitle(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SafeArea(
              child: Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomIconButton(
                    icon: Icon(SuperIcons.cl_bell_line, color: oWhite),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    hasNotif: true,
                    onPressed: () => context.goto(page: NotificationView()),
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
              padding: EdgeInsets.only(right: 20.0),
              child: Row(
                children: [
                  CustomIconButton(
                    icon: Icon(SuperIcons.cl_bell_line),

                    // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    hasNotif: true,
                    onPressed: () => context.goto(page: NotificationView()),
                  ),
                  CustomActionButton(icon: Icon(Icons.notifications, color: primaryLight)),
                  CustomAvatar(size: 40, onTap: () => context.go('/profile')),
                ],
              ),
            ),
          ],
        ),
        onRefresh: () async => Future.value(),
        sliverList: SliverList.list(
          children: [
            20.height,
            Padding(
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
            ),
            60.height,
          ],
        ),
      ),
    );
  }
}
