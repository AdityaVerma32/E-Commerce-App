import 'package:ecart/MOdels/products_model.dart';
import 'package:ecart/data/Api/api_client.dart';
import 'package:ecart/data/Repositories/popular_product_repo.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    //most of the api/http clients return status code 200 if the call isi successfull
    if (response.statusCode == 200) {
      _popularProductList = [];
      print("Got Product");
      //here we will pass a model which will convert json data to list
      _popularProductList.addAll(Product.fromJson(response.body).product);
      print(_popularProductList);
      _isLoaded = true;
      update();
    } else {}
  }
}
