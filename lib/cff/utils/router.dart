import 'package:qareen/features/chat/views/chat_list_view.dart';
import 'package:qareen/features/chat/views/chat_view.dart';
import 'package:qareen/features/notification/views/notification_view.dart';
import 'package:qareen/features/user/views/dashboard_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:qareen/cff/views/navigator_view.dart';
import 'package:qareen/cff/views/splash_view.dart';
import 'package:qareen/features/user/views/home_view.dart';
import 'package:qareen/features/user/views/profile_view.dart';
import 'package:qareen/features/user/views/registration/registration_view.dart';
import 'package:qareen/features/user/views/participant_view.dart';

// Private Navigators
final rootNavigatorKey = GlobalKey<NavigatorState>();
final _homeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'home');
final _chatNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'chat_list');
final _notificationNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'notification');
final _profileNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'profile');

final goRouterProvider = Provider<GoRouter>((ref) => router);

final GoRouter router = GoRouter(
  initialLocation: SplashView.routeName,
  navigatorKey: rootNavigatorKey,
  debugLogDiagnostics: false,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) => NavigatorView(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          navigatorKey: _homeNavigatorKey,
          routes: [
            GoRoute(
              path: HomeView.routeName,
              pageBuilder: (context, state) => NoTransitionPage(key: state.pageKey, child: const HomeView()),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _chatNavigatorKey,
          routes: [
            GoRoute(
              path: ChatListView.routeName,
              pageBuilder: (context, state) => NoTransitionPage(key: state.pageKey, child: const ChatListView()),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _notificationNavigatorKey,
          routes: [
            GoRoute(
              path: NotificationView.routeName,
              pageBuilder: (context, state) => NoTransitionPage(key: state.pageKey, child: const NotificationView()),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _profileNavigatorKey,
          routes: [
            GoRoute(
              path: ProfileView.routeName,
              pageBuilder: (context, state) => NoTransitionPage(key: state.pageKey, child: const ProfileView()),
            ),
          ],
        ),
      ],
    ),
    // COMMON PAGES
    GoRoute(path: SplashView.routeName, builder: (context, state) => const SplashView()),
  ],
);
