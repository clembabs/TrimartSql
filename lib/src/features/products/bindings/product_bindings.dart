import 'package:get/get.dart';
import 'package:sql_app/src/repositories/product/product_repository.dart';
import 'package:sql_app/src/repositories/product/product_repository_impl.dart';

class ProductBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductRepository>(() => ProductRepositoryImpl());
  }
}
