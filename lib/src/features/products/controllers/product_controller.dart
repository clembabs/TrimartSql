import 'package:get/get.dart';
import 'package:sql_app/src/features/products/model/product.dart';
import 'package:sql_app/src/features/shared/widgets/custom_snackbar.dart';
import 'package:sql_app/src/repositories/product/product_repository.dart';

class ProductController extends GetxController {
  final ProductRepository productRepository = Get.find();
  final products = <Product>[].obs;
  final RxBool isLoading = false.obs;

  void getProducts() async {
    isLoading(true);
    try {
      final fetchedProducts = await productRepository.getProducts();

      return products.assignAll(fetchedProducts);
    } catch (e) {
      CustomSnackbar.showSnackBar(
        'Oops!',
        'Error fetching products',
      );
    }
    isLoading(false);
  }

  void addProduct(Product product) async {
    isLoading(true);
    final insertedId = await productRepository.addProduct(product);
    if (insertedId != null && insertedId > 0) {
      product.id = insertedId;
      products.add(product);
    } else {
      CustomSnackbar.showSnackBar(
        'Oops!',
        'Error adding this product',
      );
    }
    isLoading(false);
  }

  void updateProduct(Product product) async {
    isLoading(true);
    final result = await productRepository.updateProduct(product);
    if (result) {
      final index = products.indexWhere((p) => p.id == product.id);
      if (index != -1) {
        products[index] = product;
      }
    } else {
      CustomSnackbar.showSnackBar(
        'Oops!',
        'Error Updating this product',
      );
    }
    isLoading(false);
  }

  void deleteProduct(int productId) async {
    isLoading(true);
    final result = await productRepository.deleteProduct(productId);
    if (result) {
      products.removeWhere((product) => product.id == productId);
    } else {
      CustomSnackbar.showSnackBar(
        'Oops!',
        'Error deleting this product',
      );
    }
    isLoading(false);
  }
}
