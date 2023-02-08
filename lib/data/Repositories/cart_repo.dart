import 'dart:convert';

import 'package:ecart/utils/app_constants.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../MOdels/cart_model.dart';

class CartRepo {
  final SharedPreferences sharedPreferences;
  CartRepo({required this.sharedPreferences});

  List<String> cart = []; // shared prefrences only accepts string
  void addToCartList(List<CartModel> cartList) {
    cart = [];
    /* 
    convert object to string 
     */
    /* cartList.forEach((element) {
      return cart.add(jsonEncode(element));
    }); */

    cartList.forEach((element) => cart.add(jsonEncode(element)));

    sharedPreferences.setStringList(AppConstants.CART_LIST, cart);

    //print(sharedPreferences.getStringList(AppConstants.CART_LIST));
    getCartList();
  }

  List<CartModel> getCartList() {
    List<String> carts = [];
    if (sharedPreferences.containsKey(AppConstants.CART_LIST)) {
      carts = sharedPreferences.getStringList(AppConstants.CART_LIST)!;
      print("Inside GetCart List" + carts.toString());
    }
    List<CartModel> cartList = [];

    /* 
    Short hand for this comment is written below
    carts.forEach((element) {
      cartList.add(CartModel.fromJson(jsonDecode(element)));
    }); */

    carts.forEach(
        (element) => cartList.add(CartModel.fromJson(jsonDecode(element))));

    return cartList;
  }
}
