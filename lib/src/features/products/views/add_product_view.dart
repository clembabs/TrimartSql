import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sql_app/src/features/products/controllers/product_controller.dart';
import 'package:sql_app/src/features/products/widgets/upload_image.dart';
import 'package:sql_app/src/features/shared/widgets/action_button.dart';
import 'package:sql_app/src/features/shared/widgets/box_form_field.dart';
import 'package:sql_app/src/features/shared/widgets/custom_app_bar.dart';
import 'package:sql_app/src/features/shared/widgets/custom_snackbar.dart';
import 'package:sql_app/src/features/shared/widgets/input_validator.dart';

class AddProductView extends StatefulWidget {
  static const String path = '/add-product';
  const AddProductView({super.key});

  @override
  State<AddProductView> createState() => _AddProductViewState();
}

class _AddProductViewState extends State<AddProductView> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final ProductController controller = Get.find();
    return Scaffold(
      appBar: const CustomAppBar(title: 'Add Product'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BoxFormField(
                    formLabel: 'Name',
                    hintText: 'Name',
                    validator: InputValidator.text,
                    autovalidateMode: autovalidateMode,
                    onChanged: controller.onChangeName,
                  ),
                  SizedBox(height: 38.h),
                  BoxFormField(
                    formLabel: 'Selling Price',
                    hintText: 'Selling Price',
                    keyboardType: TextInputType.number,
                    validator: InputValidator.number,
                    autovalidateMode: autovalidateMode,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^\d+\.?\d{0,2}')),
                    ],
                    onChanged: (value) {
                      controller
                          .onChangeSellingPrice(double.parse(value.trim()));
                    },
                  ),
                  SizedBox(height: 38.h),
                  BoxFormField(
                    formLabel: 'Cost Price',
                    hintText: 'Cost Price',
                    keyboardType: TextInputType.number,
                    validator: InputValidator.number,
                    autovalidateMode: autovalidateMode,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^\d+\.?\d{0,2}')),
                    ],
                    onChanged: (value) {
                      controller.onChangeCostPrice(double.parse(value.trim()));
                    },
                  ),
                  SizedBox(height: 38.h),
                  BoxFormField(
                    formLabel: 'Quantity',
                    hintText: 'Quantity',
                    keyboardType: TextInputType.number,
                    validator: InputValidator.number,
                    initialValue: '1',
                    autovalidateMode: autovalidateMode,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    onChanged: (value) {
                      if (value != '') {
                        controller.onChangeQuantity(int.parse(value));
                      }
                    },
                  ),
                  SizedBox(height: 38.h),
                  UploadLogo(
                    onChangeLogoFile: (value) {
                      if (value != null) {
                        controller.onChangeImage(value);
                      }
                    },
                  ),
                  SizedBox(height: 75.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 36),
                    child: ActionButton(
                      text: 'Add Product',
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
                            controller.addProduct();
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
    );
  }
}
