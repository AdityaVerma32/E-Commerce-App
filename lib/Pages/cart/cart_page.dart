import 'package:ecart/Controllers/cart_controller.dart';
import 'package:ecart/Controllers/popular_product_controller.dart';
import 'package:ecart/Controllers/recommended_product_controller.dart';
import 'package:ecart/Pages/home/main_food_page.dart';
import 'package:ecart/Routes/route_helper.dart';
import 'package:ecart/utils/app_colors.dart';
import 'package:ecart/utils/app_constants.dart';
import 'package:ecart/utils/dimensions.dart';
import 'package:ecart/widgets/app_icon.dart';
import 'package:ecart/widgets/big_text.dart';
import 'package:ecart/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Navigation buttons
          Positioned(
              top: Dimensions.height20 * 3,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.getInitial());
                    },
                    child: AppIcon(
                      icon: Icons.arrow_back_ios,
                      iconColor: Colors.white,
                      BackGroundcolor: AppColors.mainColor,
                      iconSize: Dimensions.iconsize24,
                    ),
                  ),
                  SizedBox(
                    width: Dimensions.width20 * 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.getInitial());
                    },
                    child: AppIcon(
                      icon: Icons.home,
                      iconColor: Colors.white,
                      BackGroundcolor: AppColors.mainColor,
                      iconSize: Dimensions.iconsize24,
                    ),
                  ),
                  AppIcon(
                    icon: Icons.shopping_cart,
                    iconColor: Colors.white,
                    BackGroundcolor: AppColors.mainColor,
                    iconSize: Dimensions.iconsize24,
                  )
                ],
              )),
          // List of itmes
          Positioned(
              top: Dimensions.height20 * 5,
              left: Dimensions.width20,
              right: Dimensions.width20,
              bottom: 0,
              child: Container(
                margin: EdgeInsets.only(top: Dimensions.height15),
                //color: Colors.red,
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: GetBuilder<CartController>(builder: (cartcontroller) {
                    var _cartList = cartcontroller.getItems;
                    return ListView.builder(
                        itemCount: _cartList.length,
                        itemBuilder: (_, index) {
                          return Container(
                            width: double.maxFinite,
                            height: Dimensions.height20 * 5,
                            //color: Colors.amber,
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    var popularIndex =
                                        Get.find<PopularProductController>()
                                            .popularProductList
                                            .indexOf(_cartList[index].product!);

                                    if (popularIndex >= 0) {
                                      Get.toNamed(RouteHelper.getpopularFood(
                                          popularIndex, "cartpage"));
                                    } else {
                                      var recommendedIndex = Get.find<
                                              RecommendedProductController>()
                                          .recommendedProductList
                                          .indexOf(_cartList[index].product!);
                                      if (recommendedIndex < 0) {
                                        Get.snackbar("History product",
                                            "Product review is not availble for history products",
                                            backgroundColor:
                                                AppColors.mainColor,
                                            colorText: Colors.white);
                                      } else {
                                        Get.toNamed(
                                            RouteHelper.getrecommendedFood(
                                                recommendedIndex, "cartpage"));
                                      }
                                    }
                                  },
                                  child: Container(
                                      width: Dimensions.height20 * 5,
                                      height: Dimensions.height20 * 5,
                                      margin: EdgeInsets.only(
                                          bottom: Dimensions.height10),
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(AppConstants
                                                      .BASE_URL +
                                                  AppConstants.UPLOAD_CONSTANT +
                                                  cartcontroller
                                                      .getItems[index].img!)),
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                              Dimensions.radius20))),
                                ),
                                SizedBox(
                                  width: Dimensions.width10,
                                ),
                                Expanded(
                                    child: Container(
                                  //color: Colors.amber,
                                  height: Dimensions.height20 * 5,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        BigText(
                                            text: cartcontroller
                                                .getItems[index].name!,
                                            color: Colors.black54),
                                        SmallText(text: "Spicy"),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            BigText(
                                                text: cartcontroller
                                                    .getItems[index].price
                                                    .toString(),
                                                color: Colors.redAccent),
                                            Container(
                                              padding: EdgeInsets.only(
                                                  top: Dimensions.height10 / 2,
                                                  bottom:
                                                      Dimensions.height10 / 2,
                                                  left: Dimensions.width10,
                                                  right: Dimensions.width10),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        Dimensions.radius20),
                                                color: Colors.white,
                                              ),
                                              child: Row(children: [
                                                GestureDetector(
                                                    onTap: () {
                                                      cartcontroller.addItem(
                                                          _cartList[index]
                                                              .product!,
                                                          -1);
                                                    },
                                                    child: Icon(Icons.remove,
                                                        color: AppColors
                                                            .signColor)),
                                                SizedBox(
                                                    width:
                                                        Dimensions.width10 / 2),
                                                BigText(
                                                    text: _cartList[index]
                                                        .quantity
                                                        .toString()),
                                                SizedBox(
                                                    width:
                                                        Dimensions.width10 / 2),
                                                GestureDetector(
                                                    onTap: () {
                                                      cartcontroller.addItem(
                                                          _cartList[index]
                                                              .product!,
                                                          1);
                                                    },
                                                    child: Icon(Icons.add,
                                                        color: AppColors
                                                            .signColor))
                                              ]),
                                            )
                                          ],
                                        )
                                      ]),
                                ))
                              ],
                            ),
                          );
                        });
                  }),
                ),
              ))
          // Bottom Navigation bar
        ],
      ),
      bottomNavigationBar: GetBuilder<CartController>(
        builder: (cartcontroller) {
          return Container(
            height: Dimensions.bottomheight120,
            padding: EdgeInsets.only(
                top: Dimensions.height30,
                bottom: Dimensions.height30,
                left: Dimensions.width20,
                right: Dimensions.width20),
            decoration: BoxDecoration(
                color: AppColors.buttonBackgroundColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20 * 2),
                    topRight: Radius.circular(Dimensions.radius20 * 2))),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        top: Dimensions.height15,
                        bottom: Dimensions.height15,
                        left: Dimensions.width15,
                        right: Dimensions.width15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: Colors.white,
                    ),
                    child: Row(children: [
                      SizedBox(width: Dimensions.width10 / 2),
                      BigText(
                          text: "\$ " + cartcontroller.totalAmount.toString()),
                      SizedBox(width: Dimensions.width10 / 2),
                    ]),
                  ),
                  GestureDetector(
                    onTap: () {
                      //popularProduct.addItem(product);
                      print("Tapped");
                      cartcontroller.addToHistory();
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                          top: Dimensions.height15,
                          bottom: Dimensions.height15,
                          left: Dimensions.width15,
                          right: Dimensions.width15),
                      child: BigText(text: "Check out", color: Colors.white),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20),
                          color: AppColors.mainColor),
                    ),
                  ),
                ]),
          );
        },
      ),
    );
  }
}
