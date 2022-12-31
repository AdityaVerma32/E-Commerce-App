import 'package:ecart/data/Api/api_client.dart';
import 'package:ecart/utils/app_constants.dart';

import 'package:get/get.dart';

// when we load data from Internet We must extend getxservices

class PopularProductRepo extends GetxService {
  final Apiclient apiClient;
  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async {
    return await apiClient.getData(AppConstants.POPULAR_PRODUCT_URI);
  }
}
