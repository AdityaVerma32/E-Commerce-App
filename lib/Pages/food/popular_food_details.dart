import 'package:ecart/Controllers/popular_product_controller.dart';
import 'package:ecart/MOdels/products_model.dart';
import 'package:ecart/utils/app_constants.dart';
import 'package:ecart/utils/dimensions.dart';
import 'package:ecart/widgets/app_column.dart';
import 'package:ecart/widgets/app_icon.dart';
import 'package:ecart/widgets/expandable_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';
import '../../widgets/big_text.dart';
import '../../widgets/icon_and_text_widget.dart';
import '../../widgets/small_text.dart';

class PopularFoodDetails extends StatelessWidget {
  int pageId;
  PopularFoodDetails({super.key, required this.pageId});

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProductList[pageId];
    //print("page Id is " + pageId.toString());
    //print("product name is " + product.name.toString());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //backGround Image
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                  width: double.maxFinite,
                  height: Dimensions.PopularFoodImgSize,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(AppConstants.BASE_URL +
                            AppConstants.UPLOAD_CONSTANT +
                            product.img)),
                  ))),
          //icon widget
          Positioned(
              top: Dimensions.height45,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(icon: Icons.arrow_back_ios),
                  AppIcon(icon: Icons.shopping_cart_outlined)
                ],
              )),
          //introduction of food
          Positioned(
              left: 0,
              right: 0,
              top: Dimensions.PopularFoodImgSize - 30,
              bottom: 0,
              child: Container(
                  //color: Colors.red,
                  padding: EdgeInsets.only(
                      left: Dimensions.width20,
                      right: Dimensions.width20,
                      top: Dimensions.height20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.radius20),
                        topRight: Radius.circular(Dimensions.radius20),
                      ),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppColumn(text: product.name),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      BigText(text: "Introduce"),
                      SizedBox(height: Dimensions.height10),
                      Expanded(
                        child: SingleChildScrollView(
                            child: ExpandableTextWidget(
                                text: product.description!)),
                      )
                    ],
                  )))
          //expandable text widget
        ],
      ),
      bottomNavigationBar: Container(
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
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
              Icon(Icons.remove, color: AppColors.signColor),
              SizedBox(width: Dimensions.width10 / 2),
              BigText(text: "0"),
              SizedBox(width: Dimensions.width10 / 2),
              Icon(Icons.add, color: AppColors.signColor)
            ]),
          ),
          Container(
            padding: EdgeInsets.only(
                top: Dimensions.height15,
                bottom: Dimensions.height15,
                left: Dimensions.width15,
                right: Dimensions.width15),
            child: BigText(
                text: "\$ ${product.price!} | Add to Cart",
                color: Colors.white),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: AppColors.mainColor),
          ),
        ]),
      ),
    );
  }
}
