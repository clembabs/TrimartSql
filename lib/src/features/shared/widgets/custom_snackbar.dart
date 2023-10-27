import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sql_app/src/core/constants/app_colors.dart';
import 'package:sql_app/src/core/constants/app_theme.dart';

class CustomSnackbar {
  static void showSnackBar(
    String title,
    String message,
  ) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      colorText: isLightMode(Get.context!)
          ? AppColors.rockBlackPrimary
          : AppColors.angelWhitePrimary,
      // overlayBlur: 1.2,
      backgroundColor: AppColors.brightBlue,
      margin: EdgeInsets.only(
        left: 6.0.w,
        right: 6.0.w,
        bottom: 2.0.h,
      ),
    );
  }
}
