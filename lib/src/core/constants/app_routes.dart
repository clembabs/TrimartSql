import 'package:sql_app/src/features/home/views/home_view.dart';
import 'package:sql_app/src/features/products/views/add_product_view.dart';
import 'package:sql_app/src/features/products/views/edit_product_view.dart';
import 'package:sql_app/src/features/root/views/splash_screen.dart';

class AppRoutes {
  AppRoutes._();

  static const String splashScreen = SplashScreen.path;
  static const String homeView = HomeView.path;
  static const String addProductView = AddProductView.path;
  static const String editProductView = EditProductView.path;
}
