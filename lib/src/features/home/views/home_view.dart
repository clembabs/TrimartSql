import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sql_app/src/core/constants/app_colors.dart';
import 'package:sql_app/src/core/constants/app_routes.dart';
import 'package:sql_app/src/features/home/widgets/top_header.dart';
import 'package:sql_app/src/features/products/controllers/product_controller.dart';
import 'package:sql_app/src/features/products/widgets/product_list.dart';
import 'package:sql_app/src/features/shared/widgets/loading_indicator.dart';

class HomeView extends StatelessWidget {
  static const String path = '/home';
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.find();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeTopHeader(),
              Obx(
                () => productController.isLoading.value
                    ? const LoadingIndicator()
                    : ProductList(products: productController.products),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'add-product',
        backgroundColor: AppColors.primaryColor,
        onPressed: () {
          Get.toNamed(AppRoutes.addProductView);
        },
        child: const Icon(
          Icons.add,
          color: AppColors.white,
        ),
      ),
    );
  }
}
