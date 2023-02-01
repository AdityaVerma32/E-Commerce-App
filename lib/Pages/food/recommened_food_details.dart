import 'package:ecart/Controllers/cart_controller.dart';
import 'package:ecart/Controllers/popular_product_controller.dart';
import 'package:ecart/Controllers/recommended_product_controller.dart';
import 'package:ecart/MOdels/products_model.dart';
import 'package:ecart/Routes/route_helper.dart';
import 'package:ecart/utils/app_colors.dart';
import 'package:ecart/utils/app_constants.dart';
import 'package:ecart/utils/dimensions.dart';
import 'package:ecart/widgets/app_icon.dart';
import 'package:ecart/widgets/big_text.dart';
import 'package:ecart/widgets/expandable_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class RecommenedFoodDetails extends StatelessWidget {
  int pageId;

  RecommenedFoodDetails({super.key, required this.pageId});

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<RecommendedProductController>().recommendedProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 70,
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            GestureDetector(
                onTap: () {
                  Get.toNamed(RouteHelper.getInitial());
                },
                child: AppIcon(icon: Icons.arrow_back_ios)),
            GetBuilder<PopularProductController>(builder: (controller) {
              return Stack(
                children: [
                  AppIcon(icon: Icons.shopping_cart_outlined),
                  Get.find<PopularProductController>().totalItems >= 1
                      ? Positioned(
                          right: 0,
                          top: 0,
                          child: AppIcon(
                            icon: Icons.circle,
                            size: 20,
                            iconColor: Colors.transparent,
                            BackGroundcolor: AppColors.mainColor,
                          ),
                        )
                      : Container(),
                  Get.find<PopularProductController>().totalItems >= 1
                      ? Positioned(
                          right: 6,
                          top: 2,
                          child: BigText(
                            text: Get.find<PopularProductController>()
                                .totalItems
                                .toString(),
                            size: 12,
                            color: Colors.white,
                          ),
                        )
                      : Container()
                ],
              );
            })
          ]),
          bottom: PreferredSize(
            // this child took a part of image under it.
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radius20),
                      topRight: Radius.circular(Dimensions.radius20))),
              child: Center(
                  child: BigText(
                text: product.name!,
                size: Dimensions.font26,
              )),
              width: double.maxFinite,
              padding: EdgeInsets.only(top: 5, bottom: 5),
            ),
            preferredSize: Size.fromHeight(20),
          ),
          pinned: true,
          elevation: 5,
          expandedHeight: 300,
          backgroundColor: AppColors.yellowColor,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.network(
              AppConstants.BASE_URL +
                  AppConstants.UPLOAD_CONSTANT +
                  product.img!,
              width: double.maxFinite,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverToBoxAdapter(
            child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                  left: Dimensions.width20, right: Dimensions.width20),
              child: ExpandableTextWidget(text: product.description!),
            )
          ],
        ))
      ]),
      bottomNavigationBar: GetBuilder<PopularProductController>(
        builder: (controller) {
          return Column(mainAxisSize: MainAxisSize.min, children: [
            Container(
              padding: EdgeInsets.only(
                  left: Dimensions.width20 * 2.5,
                  right: Dimensions.width20 * 2.5,
                  top: Dimensions.height10,
                  bottom: Dimensions.height10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.setQuantity(false);
                    },
                    child: AppIcon(
                      icon: Icons.remove,
                      iconColor: Colors.white,
                      BackGroundcolor: AppColors.mainColor,
                      iconSize: Dimensions.iconsize24,
                    ),
                  ),
                  BigText(
                    text: "\$ ${product.price!} " +
                        " X " +
                        " ${controller.cartItems}",
                    color: AppColors.mainBlackcolor,
                    size: Dimensions.font26,
                  ),
                  GestureDetector(
                    onTap: (() {
                      controller.setQuantity(true);
                    }),
                    child: AppIcon(
                      icon: Icons.add,
                      iconColor: Colors.white,
                      BackGroundcolor: AppColors.mainColor,
                      iconSize: Dimensions.iconsize24,
                    ),
                  )
                ],
              ),
            ),
            Container(
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
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20),
                          color: Colors.white,
                        ),
                        child: Icon(
                          Icons.favorite,
                          color: AppColors.mainColor,
                        )),
                    GestureDetector(
                      onTap: () {
                        controller.addItem(product);
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                            top: Dimensions.height15,
                            bottom: Dimensions.height15,
                            left: Dimensions.width15,
                            right: Dimensions.width15),
                        child: BigText(
                            text: "\$ ${product.price!} | Add to Cart",
                            color: Colors.white),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius20),
                            color: AppColors.mainColor),
                      ),
                    ),
                  ]),
            ),
          ]);
        },
      ),
    );
  }
}
