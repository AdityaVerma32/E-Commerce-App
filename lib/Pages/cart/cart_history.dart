// ignore_for_file: sort_child_properties_last

import 'dart:convert';

import 'package:ecart/Controllers/cart_controller.dart';
import 'package:ecart/MOdels/cart_model.dart';
import 'package:ecart/Routes/route_helper.dart';
import 'package:ecart/utils/app_colors.dart';
import 'package:ecart/utils/app_constants.dart';
import 'package:ecart/utils/dimensions.dart';
import 'package:ecart/widgets/app_icon.dart';
import 'package:ecart/widgets/big_text.dart';
import 'package:ecart/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({super.key});

  @override
  Widget build(BuildContext context) {
    var getCartHistoryList = Get.find<CartController>()
        .getCartHistoryList()
        .reversed
        .toList(); // used reversed to display the most recent at the top
    Map<String, int> cartItemsPerOrder = Map();

    for (int i = 0; i < getCartHistoryList.length; i++) {
      if (cartItemsPerOrder.containsKey(getCartHistoryList[i].time)) {
        cartItemsPerOrder.update(
            getCartHistoryList[i].time!, (value) => ++value);
      } else {
        cartItemsPerOrder.putIfAbsent(getCartHistoryList[i].time!, () => 1);
      }
    }

    List<int> cartItemsPerOrderToList() {
      return cartItemsPerOrder.entries.map((e) => e.value).toList();

      // return cartItemsPerOrder.entries.map((e) {
      //   return e.value;
      // }).toList();
    }

    List<String> cartOrderTimeToList() {
      return cartItemsPerOrder.entries.map((e) => e.key).toList();
    }

    List<int> itemsPerOrder = cartItemsPerOrderToList();

    var ListCounter = 0;

    return Scaffold(
      body: Column(
        children: [
          // for app Bar
          Container(
            height: Dimensions.height20 * 5,
            color: AppColors.mainColor,
            width: double.maxFinite,
            padding: EdgeInsets.only(
                top: Dimensions.height45,
                left: Dimensions.width10,
                right: Dimensions.width10,
                bottom: Dimensions.height10 / 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BigText(text: "Cart History", color: Colors.white),
                AppIcon(
                  icon: Icons.shopping_cart_outlined,
                  iconColor: AppColors.mainColor,
                  BackGroundcolor: AppColors.yellowColor,
                )
              ],
            ),
          ),
          // for List

          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                  top: Dimensions.height20,
                  left: Dimensions.width20,
                  right: Dimensions.width20),
              child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: ListView(
                  children: [
                    for (int i = 0; i < itemsPerOrder.length; i++)
                      Container(
                        height: Dimensions.height30 * 4,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Immediately Invoked Function
                              // Data Processing can be done using this function
                              (() {
                                // used intl dart Package
                                DateTime parseDate = DateFormat(
                                        "yyyy-MM-dd HH:mm:ss")
                                    .parse(getCartHistoryList[ListCounter]
                                        .time!); // getting the real formate data
                                var inputDate = DateTime.parse(parseDate
                                    .toString()); // converting to string
                                var outputFormat = DateFormat(
                                    "MM/dd/yyyy hh:mm a"); // getting output format
                                var outputDate = outputFormat.format(
                                    inputDate); // converting to output format
                                return BigText(text: outputDate);
                              }()),
                              SizedBox(height: Dimensions.height10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // Wrap used for wrapping diffrent things with same directions
                                  Wrap(
                                    direction: Axis.horizontal,
                                    children: List.generate(itemsPerOrder[i],
                                        (index) {
                                      if (ListCounter <
                                          getCartHistoryList.length) {
                                        ListCounter++;
                                      }
                                      return index <= 2
                                          ? Container(
                                              height: Dimensions.height20 * 4,
                                              width: Dimensions.height20 * 4,
                                              margin: EdgeInsets.only(
                                                  right:
                                                      Dimensions.width10 / 2),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          Dimensions.radius15 /
                                                              2),
                                                  image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: NetworkImage(AppConstants
                                                              .BASE_URL +
                                                          AppConstants
                                                              .UPLOAD_CONSTANT +
                                                          getCartHistoryList[
                                                                  ListCounter -
                                                                      1]
                                                              .img!))),
                                            )
                                          : Container();
                                    }),
                                  ),
                                  Container(
                                    height: Dimensions.height20 * 4,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        SmallText(
                                          text: "Total",
                                          color: AppColors.titleColor,
                                        ),
                                        BigText(
                                          text: itemsPerOrder[i].toString() +
                                              " Items",
                                          color: AppColors.titleColor,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            var orderTime =
                                                cartOrderTimeToList();

                                            Map<int, CartModel> moreOrder = {};

                                            for (int j = 0;
                                                j < getCartHistoryList.length;
                                                j++) {
                                              if (getCartHistoryList[j].time ==
                                                  orderTime[i]) {
                                                // print("The product id is " +
                                                //     getCartHistoryList[j]
                                                //         .id
                                                //         .toString());
                                                moreOrder.putIfAbsent(
                                                    getCartHistoryList[j].id!,
                                                    () => CartModel.fromJson(
                                                        jsonDecode(jsonEncode(
                                                            getCartHistoryList[
                                                                j]))));
                                              }
                                            }
                                            Get.find<CartController>()
                                                .setItems = moreOrder;
                                            Get.find<CartController>()
                                                .addToCartList();
                                            Get.toNamed(
                                                RouteHelper.getcartPage());
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: Dimensions.width10,
                                                vertical:
                                                    Dimensions.height10 / 2),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 1,
                                                    color: AppColors.mainColor),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        Dimensions.radius15 /
                                                            3)),
                                            child: SmallText(
                                              text: "one More",
                                              color: AppColors.mainColor,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ]),
                        margin: EdgeInsets.only(bottom: Dimensions.height20),
                      )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
