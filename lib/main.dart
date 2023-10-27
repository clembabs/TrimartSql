import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sql_app/src/core/constants/app_pages.dart';
import 'package:sql_app/src/core/constants/app_routes.dart';
import 'package:sql_app/src/core/constants/app_theme.dart';
import 'package:sql_app/src/features/products/bindings/product_bindings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ///rotation off

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return GestureDetector(
      onTap: () {
        var currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusScope.of(context).requestFocus(FocusNode());
        }
      },
      child: ScreenUtilInit(
        designSize: const Size(428, 926),
        minTextAdapt: true,
        builder: (context, child) {
          return GetMaterialApp(
            title: 'TrimartSql',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            // darkTheme: AppTheme.darkTheme,
            themeMode: ThemeMode.system,
            getPages: AppPages.pages,
            initialBinding: ProductBindings(),
            smartManagement: SmartManagement.onlyBuilder,
            initialRoute: AppRoutes.splashScreen,
          );
        },
      ),
    );
  }
}
