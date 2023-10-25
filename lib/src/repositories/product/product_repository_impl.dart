import 'package:sql_app/src/features/products/model/product.dart';
import 'package:sql_app/src/features/shared/model/custom_response.dart';
import 'package:sql_app/src/repositories/product/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  ProductRepositoryImpl();

  @override
  Future<List<Product>> getProducts() async {
    try {
      final products = await Product().select().toList();
      return products;
    } catch (e) {
      throw const CustomResponse(
        message: 'Error fetching products',
        status: 'Error',
      );
    }
  }

  @override
  Future<int?> addProduct(Product product) async {
    try {
      final insertedId = await product.save();
      return insertedId;
    } catch (e) {
      throw const CustomResponse(
        message: 'Error adding product',
        status: 'Error',
      );
    }
  }

  @override
  Future<bool> updateProduct(Product product) async {
    try {
      await product.upsert();
      return true;
    } catch (e) {
      throw const CustomResponse(
        message: 'Error updating product',
        status: 'Error',
      );
    }
  }

  @override
  Future<bool> deleteProduct(int productId) async {
    try {
      await Product().select().id.equals(productId).delete();

      return true;
    } catch (e) {
      throw const CustomResponse(
        message: 'Error deleting product',
        status: 'Error',
      );
    }
  }
}
