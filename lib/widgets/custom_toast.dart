import 'package:bach_flutter_app/constants/app_colors.dart';
import 'package:bach_flutter_app/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

class CustomToast {
  static showSuccessToast(String msg) {
    showToast(msg,
        duration: const Duration(seconds: 1),
        backgroundColor: AppColors.successColor,
        position: ToastPosition.bottom,
        textStyle: AppStyles.mediumNormalWhite,
        textPadding: EdgeInsets.all(8.0));
  }

  static showWarningToast(String msg) {
    showToast(msg,
        duration: const Duration(seconds: 1),
        backgroundColor: AppColors.warningColor,
        position: ToastPosition.bottom,
        textStyle: AppStyles.mediumNormalWhite,
        textPadding: EdgeInsets.all(8.0));
  }

  static showFailureToast(String msg) {
    showToast(msg,
        duration: const Duration(seconds: 1),
        backgroundColor: AppColors.failureColor,
        position: ToastPosition.bottom,
        textStyle: AppStyles.mediumNormalWhite,
        textPadding: EdgeInsets.all(8.0));
  }
}
