import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sql_app/src/core/constants/app_colors.dart';
import 'package:sql_app/src/core/constants/app_text_styles.dart';

class CustomDialog {
  static void showDialog({
    required String title,
    required Function()? onPressedDelete,
    required Function()? onPressedEdit,
  }) {
    Get.dialog(
      AlertDialog(
        title: Text(title),
        actionsAlignment: MainAxisAlignment.start,
        actions: [
          TextButton(
            onPressed: onPressedDelete,
            child: Text(
              'Delete Product',
              style: AppTextStyles.bodyOnePoppins.copyWith(
                color: AppColors.black,
                fontSize: 15.sp,
              ),
            ),
          ),
          TextButton(
            onPressed: onPressedEdit,
            child: Text(
              'Edit Product',
              style: AppTextStyles.bodyOnePoppins.copyWith(
                color: AppColors.black,
                fontSize: 15.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
