import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

class SnackBarUtil {
  static void info({
    required String message,
    Function(dynamic)? onTap,
    Duration duration = const Duration(seconds: 5),
  }) {
    BotToast.showCustomNotification(
      duration: duration,
      toastBuilder: (_) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 12,
          ),
          child: Text(
            message,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
          ),
        );
      },
    );
  }

  static void error({
    required String message,
    Function(dynamic)? onTap,
    Duration duration = const Duration(seconds: 3),
    String? logScreenName = '',
    String? logMethodName = '',
    String? logMessage = '',
  }) {
    BotToast.showCustomNotification(
      toastBuilder: (_) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 12,
          ),
          child: Text(
            message,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
          ),
        );
      },
    );
  }
}
