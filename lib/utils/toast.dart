import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import '../theme/app_text_theme.dart';

enum ToastType { success, warning, failure }

class Toast {
  static void success({required String message}) {
    showToast(message,
        duration: const Duration(seconds: 1),
        // backgroundColor: AppColor.success,
        position: ToastPosition.bottom,
        textStyle: AppTextTheme.mediumBodyText(Colors.white),
        textPadding: const EdgeInsets.all(8.0));
  }

  static void error({required String message}) {
    showToast(message,
        duration: const Duration(seconds: 1),
        // backgroundColor: AppColor.error,
        position: ToastPosition.bottom,
        textStyle: AppTextTheme.mediumBodyText(Colors.white),
        textPadding: const EdgeInsets.all(8.0));
  }

  static void warn({required String message}) {
    showToast(message,
        duration: const Duration(seconds: 1),
        // backgroundColor: AppColor.warn,
        position: ToastPosition.bottom,
        textStyle: AppTextTheme.mediumBodyText(Colors.white),
        textPadding: const EdgeInsets.all(8.0));
  }
}
