import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sql_app/src/core/constants/app_colors.dart';
import 'package:sql_app/src/core/constants/app_routes.dart';
import 'package:sql_app/src/core/constants/lotties.dart';
import 'package:sql_app/src/features/products/controllers/product_controller.dart';

class SplashScreen extends StatefulWidget {
  static const String path = '/splash_screen';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    splashNavigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.primaryColor,
        height: Get.height,
        width: Get.width,
        child: Center(
          child: Lottie.asset(
            Lotties.loadingLottie,
            width: 300.w,
            height: 300.h,
          ).paddingAll(20),
        ),
      ),
    );
  }

  splashNavigation() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.put(ProductController());
      Get.offNamed(AppRoutes.homeView);
    });
  }
}
