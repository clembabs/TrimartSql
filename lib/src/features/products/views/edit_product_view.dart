import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sql_app/src/features/products/controllers/edit_product_controller.dart';
import 'package:sql_app/src/features/products/widgets/upload_image.dart';
import 'package:sql_app/src/features/shared/widgets/action_button.dart';
import 'package:sql_app/src/features/shared/widgets/box_form_field.dart';
import 'package:sql_app/src/features/shared/widgets/custom_app_bar.dart';
import 'package:sql_app/src/features/shared/widgets/custom_snackbar.dart';
import 'package:sql_app/src/features/shared/widgets/input_validator.dart';

class EditProductView extends StatefulWidget {
  static const String path = '/edit-product/';
  const EditProductView({super.key});

  @override
  State<EditProductView> createState() => _EditProductViewState();
}

class _EditProductViewState extends State<EditProductView> {
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    Get.delete<EditProductController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final EditProductController controller = Get.find();
    return Scaffold(
      appBar: const CustomAppBar(title: 'Edit Product'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
          child: SingleChildScrollView(
            child: Obx(
              () => Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BoxFormField(
                      formLabel: 'Name',
                      hintText: 'Name',
                      initialValue: controller.product.name,
                      validator: InputValidator.text,
                      autovalidateMode: autovalidateMode,
                      onChanged: controller.onEditName,
                    ),
                    SizedBox(height: 38.h),
                    BoxFormField(
                      formLabel: 'Selling Price',
                      hintText: 'Selling Price',
                      initialValue: controller.product.selling_price.toString(),
                      keyboardType: TextInputType.number,
                      validator: InputValidator.number,
                      autovalidateMode: autovalidateMode,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^\d+\.?\d{0,2}')),
                      ],
                      onChanged: (value) {
                        controller
                            .onEditSellingPrice(double.parse(value.trim()));
                      },
                      // controller: emailController,
                    ),
                    SizedBox(height: 38.h),
                    BoxFormField(
                      formLabel: 'Cost Price',
                      hintText: 'Cost Price',
                      initialValue: controller.product.cost_price.toString(),
                      keyboardType: TextInputType.number,
                      validator: InputValidator.number,
                      autovalidateMode: autovalidateMode,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^\d+\.?\d{0,2}')),
                      ],
                      onChanged: (value) {
                        if (value != '') {
                          controller
                              .onEditCostPrice(double.parse(value.trim()));
                        }
                      },
                    ),
                    SizedBox(height: 38.h),
                    BoxFormField(
                      formLabel: 'Quantity',
                      hintText: 'Quantity',
                      initialValue: controller.product.quantity.toString(),
                      keyboardType: TextInputType.number,
                      validator: InputValidator.number,
                      autovalidateMode: autovalidateMode,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      onChanged: (value) {
                        if (value != '') {
                          controller.onEditQuantity(int.parse(value));
                        }
                      },
                    ),
                    SizedBox(height: 38.h),
                    UploadLogo(
                      image: controller.product.imageUrl,
                      onChangeLogoFile: (value) {
                        if (value != null) {
                          controller.onEditImage(value);
                        }
                      },
                    ),
                    SizedBox(height: 75.h),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 36),
                      child: ActionButton(
                        text: 'Edit Product',
                        width: double.infinity,
                        height: 51.h,
                        onTap: () {
                          FocusScope.of(context).unfocus();

                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState?.save();
                            if (controller.product.quantity! <= 0) {
                              CustomSnackbar.showSnackBar(
                                  'Oopps', 'Quantity can not be zero');
                            } else {
                              controller.updateProduct();
                            }
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
