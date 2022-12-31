import 'package:ecart/Controllers/popular_product_controller.dart';
import 'package:ecart/data/Api/api_client.dart';
import 'package:ecart/data/Repositories/popular_product_repo.dart';
import 'package:ecart/utils/app_constants.dart';
import 'package:get/get.dart';

import '../Controllers/recommended_product_controller.dart';
import '../data/Repositories/recommended_product_repo.dart';

Future<void> init() async {
  //Api Client
  Get.lazyPut(() => Apiclient(appBaseurl: AppConstants.BASE_URL));

  //Repositories
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));

  //Controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(
      () => RecommendedProductController(recommendedProductRepo: Get.find()));
}
