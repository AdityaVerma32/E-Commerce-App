import 'package:ecart/data/Api/api_client.dart';
import 'package:ecart/utils/app_constants.dart';

import 'package:get/get.dart';

// when we load data from Internet We must extend getxservices

class RecommendedProductRepo extends GetxService {
  final Apiclient apiClient;
  RecommendedProductRepo({required this.apiClient});

  Future<Response> getRecommendedProductList() async {
    return await apiClient.getData(AppConstants.RECOMMENDED_PRODUCT_URI);
  }
}
