import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:sql_app/src/features/products/model/product.dart';
import 'package:sql_app/src/features/shared/widgets/custom_snackbar.dart';
import 'package:sql_app/src/repositories/product/product_repository.dart';

class ProductController extends GetxController {
  final ProductRepository productRepository = Get.find();
  final RxList<Product> products = <Product>[].obs;
  final RxBool isLoading = false.obs;

  late Rx<Product> _product;

  Product get product => _product.value;

  ProductController({Product? currentProduct, String? id}) {
    _product = (currentProduct ?? Product()).obs;
  }

  @override
  void onInit() {
    getProducts();
    super.onInit();
  }

  void onChangeName(String name) {
    _product.value.name = name;
    _product.refresh();
  }

  void onChangeSellingPrice(double sellingPrice) {
    _product.value.selling_price = sellingPrice;
    _product.refresh();
  }

  void onChangeCostPrice(double costPrice) {
    _product.value.cost_price = costPrice;
    _product.refresh();
  }

  void onChangeQuantity(int quantity) {
    _product.value.quantity = quantity;
    _product.refresh();
  }

  void onChangeImage(Uint8List imageData) {
    _product.value.imageUrl = imageData;
    _product.refresh();
  }

  void getProducts() async {
    isLoading(true);
    try {
      final fetchedProducts = await productRepository.getProducts();

      products.assignAll(fetchedProducts);
    } catch (e) {
      CustomSnackbar.showSnackBar(
        'Oops!',
        'Error fetching products',
      );
    }
    isLoading(false);
  }

  void addProduct() async {
    isLoading(true);
    final insertedId = await productRepository.addProduct(product);
    if (insertedId != null && insertedId > 0) {
      product.id = insertedId;
      products.add(product);

      Get.back();
      CustomSnackbar.showSnackBar(
        'Success!',
        'Product Added successfully',
      );
    } else {
      CustomSnackbar.showSnackBar(
        'Oops!',
        'Error adding this product',
      );
    }
    isLoading(false);
  }

  void deleteProduct(int productId) async {
    isLoading(true);
    final result = await productRepository.deleteProduct(productId);
    if (result) {
      products.removeWhere((product) => product.id == productId);
      Get.back();
      CustomSnackbar.showSnackBar(
        'Success!',
        'Product Deleted successfully',
      );
    } else {
      CustomSnackbar.showSnackBar(
        'Oops!',
        'Error deleting this product',
      );
    }
    isLoading(false);
  }
}
