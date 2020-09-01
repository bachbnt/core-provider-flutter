import 'package:bach_flutter_app/constants/app_colors.dart';
import 'package:bach_flutter_app/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

enum ToastType { Success, Warning, Failure }

class AppToast {
  static void show(
      {@required String message, @required ToastType toastType}) {
    Color toastColor;
    switch (toastType) {
      case (ToastType.Success):
        toastColor = AppColors.successColor;
        break;
      case (ToastType.Warning):
        toastColor = AppColors.warningColor;
        break;
      case (ToastType.Failure):
        toastColor = AppColors.failureColor;
        break;
    }
    showToast(message,
        duration: const Duration(seconds: 1),
        backgroundColor: toastColor,
        position: ToastPosition.bottom,
        textStyle: AppStyles.mediumNormalWhite,
        textPadding: const EdgeInsets.all(8.0));
  }
}
