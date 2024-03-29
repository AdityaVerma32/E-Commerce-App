import 'package:ecart/Controllers/popular_product_controller.dart';
import 'package:ecart/Pages/food/popular_food_details.dart';
import 'package:ecart/Pages/food/recommened_food_details.dart';
import 'package:ecart/Pages/home/main_food_page.dart';
import 'package:ecart/Routes/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Controllers/recommended_product_controller.dart';
import 'helper/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MainFoodPage(),
      initialRoute: RouteHelper.initial,
      getPages: RouteHelper.routes,
    );
  }
}
