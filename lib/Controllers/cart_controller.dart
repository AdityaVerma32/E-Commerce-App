import 'package:ecart/MOdels/cart_model.dart';
import 'package:ecart/MOdels/products_model.dart';
import 'package:ecart/data/Repositories/cart_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  CartController({required this.cartRepo});

  Map<int, CartModel> _items = {};

  Map<int, CartModel> get items => _items;

  void addItem(ProductsModel product, int quantity) {
    //print("length of the item is " + _items.length.toString());
    var totalQuantity = 0;
    if (_items.containsKey(product.id!)) {
      _items.update(product.id!, (value) {
        totalQuantity = value.quantity! + quantity;

        return CartModel(
            id: value.id,
            name: value.name,
            price: value.price,
            img: value.img,
            isExist: true,
            quantity: value.quantity! + quantity,
            time: DateTime.now().toString());
      });

      if (totalQuantity <= 0) {
        _items.remove(product.id);
      }
    } else {
      if (quantity > 0) {
        _items.putIfAbsent(product.id!, () {
          return CartModel(
              id: product.id,
              name: product.name,
              price: product.price,
              img: product.img,
              isExist: true,
              quantity: quantity,
              time: DateTime.now().toString());
        });
      } else {
        Get.snackbar(
            "Item Count", "You should at least add one item to the cart!",
            backgroundColor: AppColors.mainColor, colorText: Colors.white);
      }
    }
  }

  bool existInCart(ProductsModel product) {
    if (_items.containsKey(product.id)) {
      return true;
    }
    return false;
  }

  int getQuantity(ProductsModel product) {
    var quantity = 0;
    if (_items.containsKey(product.id)) {
      // first we check if that cart map contains the product
      _items.forEach((key, value) {
        // than we traverse over all the map to find that key
        if (key == product.id) {
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }

  int get totalItems {
    var totalQuantity = 0;
    _items.forEach((key, value) {
      totalQuantity = totalQuantity + value.quantity!;
    });
    return totalQuantity;
  }
}
