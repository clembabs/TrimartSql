import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:sql_app/src/features/products/controllers/product_controller.dart';
import 'package:sql_app/src/features/products/model/product.dart';
import 'package:sql_app/src/features/shared/widgets/custom_snackbar.dart';

class EditProductController extends GetxController {
  final ProductController productController = Get.find();

  final RxBool isLoading = false.obs;

  late Rx<Product> _product;

  Product get product => _product.value;

  EditProductController({Product? currentProduct}) {
    _product = (currentProduct ?? Product()).obs;
  }

  @override
  void onInit() {
    getProductById(product.id.toString());
    super.onInit();
  }

  void onEditName(String name) {
    _product.value.name = name;
    _product.refresh();
  }

  void onEditSellingPrice(double sellingPrice) {
    _product.value.selling_price = sellingPrice;
    _product.refresh();
  }

  void onEditCostPrice(double costPrice) {
    _product.value.cost_price = costPrice;
    _product.refresh();
  }

  void onEditQuantity(int quantity) {
    _product.value.quantity = quantity;
    _product.refresh();
  }

  void onEditImage(Uint8List imageData) {
    _product.value.imageUrl = imageData;
    _product.refresh();
  }

  void getProductById(String productId) async {
    isLoading(true);
    try {
      final fetchedProduct =
          await productController.productRepository.getProductbyId(productId);
      _product.value = fetchedProduct;
    } catch (e) {
      CustomSnackbar.showSnackBar(
        'Oops!',
        'Error fetching products',
      );
    }
    isLoading(false);
  }

  void updateProduct() async {
    isLoading(true);
    final result =
        await productController.productRepository.updateProduct(product);
    if (result) {
      final index =
          productController.products.indexWhere((p) => p.id == product.id);
      if (index != -1) {
        productController.products[index] = product;
      }
      productController.getProducts();
      Get.back();
      CustomSnackbar.showSnackBar(
        'Success!',
        'Product Edited successfully',
      );
    } else {
      CustomSnackbar.showSnackBar(
        'Oops!',
        'Error Updating this product',
      );
    }
    isLoading(false);
  }
}
