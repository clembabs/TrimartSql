import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sql_app/src/core/constants/app_colors.dart';
import 'package:sql_app/src/core/constants/app_routes.dart';
import 'package:sql_app/src/core/constants/app_text_styles.dart';
import 'package:sql_app/src/features/products/controllers/edit_product_controller.dart';
import 'package:sql_app/src/features/products/controllers/product_controller.dart';
import 'package:sql_app/src/features/products/model/product.dart';
import 'package:sql_app/src/features/products/widgets/product_list_item.dart';
import 'package:sql_app/src/features/shared/widgets/custom_dialog.dart';

class ProductList extends StatelessWidget {
  final List<Product> products;
  const ProductList({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    final ProductController controller = Get.find();
    return Container(
      color: AppColors.white,
      padding: EdgeInsets.symmetric(vertical: 15.h),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: products.isNotEmpty
            ? Column(
                children: products
                    .map(
                      (product) => Padding(
                        padding: EdgeInsets.only(bottom: 15.h),
                        child: InkWell(
                          onTap: () => CustomDialog.showDialog(
                            title: product.name!,
                            onPressedDelete: () {
                              Get.back();
                              controller.deleteProduct(product.id!);
                            },
                            onPressedEdit: () {
                              Get.back();
                              Get.put(EditProductController(
                                  currentProduct: product));
                              Get.toNamed(AppRoutes.editProductView +
                                  product.id.toString());
                            },
                          ),
                          child: ProductListItem(product: product),
                        ),
                      ),
                    )
                    .toList(),
              )
            : Align(
                alignment: Alignment.center,
                child: Text(
                  'No Products available, Please add products',
                  style: AppTextStyles.displayThree,
                ),
              ),
      ),
    );
  }
}
