import 'package:ecart/MOdels/cart_model.dart';
import 'package:ecart/MOdels/products_model.dart';
import 'package:ecart/data/Repositories/cart_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  CartController({required this.cartRepo});

  Map<int, CartModel> _items = {}; // map where cart item are stored

  Map<int, CartModel> get items => _items;

  List<CartModel> storageItems =
      []; // only for local storage and shared prefrences

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
            time: DateTime.now().toString(),
            product: product);
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
              time: DateTime.now().toString(),
              product: product);
        });
      } else {
        Get.snackbar(
            "Item Count", "You should at least add one item to the cart!",
            backgroundColor: AppColors.mainColor, colorText: Colors.white);
      }
    }
    cartRepo.addToCartList(getItems);
    update();
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

  List<CartModel> get getItems {
    return _items.entries.map((e) {
      return e.value;
    }).toList();
  }

  int get totalAmount {
    var total = 0;
    _items.forEach((key, value) {
      total += value.quantity! * value.price!;
    });

    return total;
  }

  List<CartModel> getCartData() {
    setcart = cartRepo.getCartList();
    return storageItems;
  }

  set setcart(List<CartModel> items) {
    storageItems = items;
    print("Length of Cart Items " + storageItems.length.toString());
    for (int i = 0; i < storageItems.length; i++) {
      _items.putIfAbsent(storageItems[i].product!.id!, () => storageItems[i]);
    }
  }

  void addToHistory() {
    cartRepo.addToCartHistoryList();
    clear();
  }

  void clear() {
    _items = {};
    update();
  }

  List<CartModel> getCartHistoryList() {
    return cartRepo.getCartHistoryList();
  }

  set setItems(Map<int, CartModel> setItems) {
    _items = {};
    _items = setItems;
  }

  void addToCartList() {
    cartRepo.addToCartList(getItems);
    update();
  }
}
