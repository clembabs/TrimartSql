import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sql_app/src/core/constants/app_colors.dart';
import 'package:sql_app/src/core/constants/app_text_styles.dart';
import 'package:sql_app/src/features/products/model/product.dart';
import 'package:sql_app/src/features/shared/widgets/custom_image_widget.dart';

class ProductListItem extends StatelessWidget {
  final Product product;
  const ProductListItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) => Container(
        height: 120.h,
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Card(
            shadowColor: Colors.black.withOpacity(0.2),
            child: Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomImageWidget(
                      imageUrl: product.imageUrl ?? '',
                      width: 90.w,
                      height: 90.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.w, right: 10.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Name:   ',
                            style: AppTextStyles.bodyOnePoppins.copyWith(
                                color: AppColors.black.withOpacity(.6),
                                fontSize: 14.sp),
                          ),
                          Text(
                            product.name ?? '',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.bodyOnePoppins.copyWith(
                                color: AppColors.black, fontSize: 14.sp),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Selling Price:   ',
                            style: AppTextStyles.bodyOnePoppins.copyWith(
                              color: AppColors.black.withOpacity(.6),
                              fontSize: 12.sp,
                            ),
                          ),
                          Text(
                            'N ${product.selling_price}',
                            style: AppTextStyles.bodyOnePoppins.copyWith(
                              color: AppColors.black,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Cost Price:   ',
                            style: AppTextStyles.bodyOnePoppins.copyWith(
                              color: AppColors.black.withOpacity(.6),
                              fontSize: 12.sp,
                            ),
                          ),
                          Text(
                            'N ${product.cost_price}',
                            style: AppTextStyles.bodyOnePoppins.copyWith(
                              color: AppColors.black,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Quantity:  ',
                            style: AppTextStyles.bodyOnePoppins.copyWith(
                              color: AppColors.black.withOpacity(.6),
                              fontSize: 12.sp,
                            ),
                          ),
                          Text(
                            product.quantity.toString(),
                            style: AppTextStyles.bodyOnePoppins.copyWith(
                                color: AppColors.black, fontSize: 12.sp),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
