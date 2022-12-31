import 'package:ecart/MOdels/products_model.dart';
import 'package:ecart/data/Api/api_client.dart';
import 'package:ecart/data/Repositories/popular_product_repo.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import '../data/Repositories/recommended_product_repo.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;

  RecommendedProductController({required this.recommendedProductRepo});
  List<dynamic> _recommendedProductList = [];
  List<dynamic> get recommendedProductList => _recommendedProductList;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getRecommendedProductList() async {
    Response response =
        await recommendedProductRepo.getRecommendedProductList();
    //most of the api/http clients return status code 200 if the call isi successfull
    if (response.statusCode == 200) {
      _recommendedProductList = [];
      print("Got Product Recommended");
      //here we will pass a model which will convert json data to list
      _recommendedProductList.addAll(Product.fromJson(response.body).product);
      print(_recommendedProductList);
      _isLoaded = true;
      update();
    } else {
      print("Could not load Recommended Products");
    }
  }
}
