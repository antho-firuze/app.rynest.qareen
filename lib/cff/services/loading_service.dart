import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qareen/cff/utils/router.dart';

import '../views/loading_view.dart';

class LoadingService {
  static void show([List<String>? message]) {
    showGeneralDialog(
      context: rootNavigatorKey.currentContext!,
      pageBuilder: (context, animation, secondaryAnimation) => LoadingView(messages: message),
    );
  }

  static void dissmiss() {
    rootNavigatorKey.currentContext!.pop();
  }
}
