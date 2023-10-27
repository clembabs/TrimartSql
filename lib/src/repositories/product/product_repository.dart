import 'package:sql_app/src/features/products/model/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getProducts();

  Future<Product> getProductbyId(String productId);

  Future<int?> addProduct(Product product);

  Future<bool> updateProduct(Product product);

  Future<bool> deleteProduct(int productId);
}
