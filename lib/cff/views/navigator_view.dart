import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:super_icons/super_icons.dart';

// Stateful navigation based on:
// https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/stateful_shell_route.dart
class NavigatorView extends StatelessWidget {
  const NavigatorView({Key? key, required this.navigationShell}) : super(key: key ?? const ValueKey('DashboardView'));
  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    if (size.width < 450) {
      return ScaffoldWithNavigationBar(
        body: navigationShell,
        currentIndex: navigationShell.currentIndex,
        onDestinationSelected: _goBranch,
      );
    } else {
      return ScaffoldWithNavigationRail(
        body: navigationShell,
        currentIndex: navigationShell.currentIndex,
        onDestinationSelected: _goBranch,
      );
    }
  }
}

class ScaffoldWithNavigationBar extends StatelessWidget {
  const ScaffoldWithNavigationBar({
    super.key,
    required this.body,
    required this.currentIndex,
    required this.onDestinationSelected,
  });
  final Widget body;
  final int currentIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(.8)),
      child: Scaffold(
        body: body,
        bottomNavigationBar: NavigationBar(
          height: 55,
          indicatorShape: const CircleBorder(eccentricity: 1.0),
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          indicatorColor: Colors.transparent,
          // backgroundColor: primaryLight.darken(),
          selectedIndex: currentIndex,
          destinations: [
            NavigationDestination(
              icon: const Icon(SuperIcons.bx_home_circle),
              selectedIcon: const Icon(SuperIcons.bx_home_circle_solid),
              label: 'Home',
            ),
            NavigationDestination(
              icon: const Icon(SuperIcons.is_element_4_bold),
              selectedIcon: const Icon(SuperIcons.is_element_3_bold),
              label: 'Dashboard',
            ),
            // NavigationDestination(icon: Container(), label: '', enabled: false),
            NavigationDestination(
              icon: const Icon(SuperIcons.is_user_octagon_outline),
              selectedIcon: const Icon(SuperIcons.is_user_octagon_bold),
              label: 'Peserta',
            ),
            NavigationDestination(
              icon: const Icon(SuperIcons.bs_person),
              selectedIcon: const Icon(SuperIcons.bs_person_heart),
              label: 'Profile',
            ),
          ],
          onDestinationSelected: onDestinationSelected,
        ),
      ),
    );
  }
}

class ScaffoldWithNavigationRail extends StatelessWidget {
  const ScaffoldWithNavigationRail({
    super.key,
    required this.body,
    required this.currentIndex,
    required this.onDestinationSelected,
  });
  final Widget body;
  final int currentIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(.7)),
      child: Scaffold(
        body: Row(
          children: [
            NavigationRail(
              selectedIndex: currentIndex,
              onDestinationSelected: onDestinationSelected,
              labelType: NavigationRailLabelType.all,
              destinations: <NavigationRailDestination>[
                NavigationRailDestination(
                  icon: const Icon(SuperIcons.bx_home_circle),
                  selectedIcon: const Icon(SuperIcons.bx_home_circle_solid),
                  label: Text('Home'),
                ),
                NavigationRailDestination(
                  icon: const Icon(SuperIcons.ev_calendar_outline),
                  selectedIcon: const Icon(SuperIcons.ev_calendar),
                  label: Text('Dashboard'),
                ),
                NavigationRailDestination(
                  icon: const Icon(SuperIcons.mg_bill_line),
                  selectedIcon: const Icon(SuperIcons.mg_bill_fill),
                  label: Text('Peserta'),
                ),
                NavigationRailDestination(
                  icon: const Icon(SuperIcons.bs_person),
                  selectedIcon: const Icon(SuperIcons.bs_person_heart),
                  label: Text('Profile'),
                ),
              ],
            ),
            const VerticalDivider(thickness: 1, width: 1),
            // This is the main content.
            Expanded(child: body),
          ],
        ),
      ),
    );
  }
}
