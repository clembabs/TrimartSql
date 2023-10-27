import 'package:get/get.dart';
import 'package:sql_app/src/core/constants/app_routes.dart';
import 'package:sql_app/src/features/home/views/home_view.dart';
import 'package:sql_app/src/features/products/bindings/product_bindings.dart';
import 'package:sql_app/src/features/products/views/add_product_view.dart';
import 'package:sql_app/src/features/products/views/edit_product_view.dart';
import 'package:sql_app/src/features/root/views/splash_screen.dart';

abstract class AppPages {
  static final List<GetPage<dynamic>> pages = <GetPage<dynamic>>[
    GetPage(
      name: AppRoutes.splashScreen,
      page: () => const SplashScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: AppRoutes.homeView,
      page: () => const HomeView(),
      transition: Transition.fadeIn,
      binding: ProductBindings(),
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: AppRoutes.addProductView,
      page: () => const AddProductView(),
      binding: ProductBindings(),
    ),
    GetPage(
      name: '${AppRoutes.editProductView}:id',
      page: () => const EditProductView(),
      binding: ProductBindings(),
    ),
  ];
}
