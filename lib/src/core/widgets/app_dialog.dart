import 'package:flutter/material.dart';

import 'app_loading.dart';

class AppDialog {
  static showAppDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => const AlertDialog(
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          elevation: 0,
          content: AppLoading()),
    );
  }
}
