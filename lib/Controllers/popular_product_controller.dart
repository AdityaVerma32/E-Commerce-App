import 'package:ecart/Controllers/cart_controller.dart';
import 'package:ecart/MOdels/cart_model.dart';
import 'package:ecart/MOdels/products_model.dart';
import 'package:ecart/data/Api/api_client.dart';
import 'package:ecart/data/Repositories/popular_product_repo.dart';
import 'package:ecart/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;
  late CartController _cart;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity = 0;
  int get quantity => _quantity;

  int _cartItems = 0;
  int get cartItems => _cartItems + _quantity;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    //most of the api/http clients return status code 200 if the call isi successfull
    if (response.statusCode == 200) {
      _popularProductList = [];
      print("Got Product");
      //here we will pass a model which will convert json data to list
      _popularProductList.addAll(Product.fromJson(response.body).product);
      //print(_popularProductList);
      _isLoaded = true;
      update();
    } else {
      print("Could not fetch the Data");
    }
  }

  void setQuantity(bool isIncreament) {
    if (isIncreament) {
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
    }
    update(); // to update the ui immediatelly
  }

  int checkQuantity(int quantity) {
    if ((_cartItems + quantity) < 0) {
      Get.snackbar("Item Count", "You can't reduce more !",
          backgroundColor: AppColors.mainColor, colorText: Colors.white);
      if (_cartItems > 0) {
        _quantity = -_cartItems;
        return _quantity;
      }
      return 0;
    } else if ((_cartItems + quantity) > 20) {
      return 20;
    } else {
      return quantity;
    }
  }

  void initProduct(ProductsModel product, CartController cart) {
    _quantity = 0;
    _cartItems = 0;
    _cart = cart;

    var exist = false;
    exist = _cart.existInCart(product);
    print("Exists or Not : " + exist.toString());
    if (exist) {
      _cartItems = cart.getQuantity(product);
    }
    //print("Quantity in the cart is " + _cartItems.toString());
    // if exist tehn get th.exe item
    // get from storage _inCartIt ems=3
  }

  void addItem(ProductsModel product) {
    //if (_quantity > 0) {
    _cart.addItem(product, _quantity);
    _quantity = 0; // quantity will only have value when add item is not clicked

    _cartItems = _cart.getQuantity(product);

    _cart.items.forEach((key, value) {
      print("The Id is " +
          value.id.toString() +
          " The quantity is " +
          value.quantity.toString());
    });
    update(); // to update UI when something is added to cart
  }

  int get totalItems {
    return _cart.totalItems;
  }

  List<CartModel> get getItems {
    return _cart.getItems;
  }
}
