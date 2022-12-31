import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecart/Controllers/popular_product_controller.dart';
import 'package:ecart/Controllers/recommended_product_controller.dart';
import 'package:ecart/MOdels/products_model.dart';
import 'package:ecart/Pages/food/popular_food_details.dart';
import 'package:ecart/Pages/home/main_food_page.dart';
import 'package:ecart/Routes/route_helper.dart';
import 'package:ecart/utils/app_colors.dart';
import 'package:ecart/utils/app_constants.dart';
import 'package:ecart/utils/dimensions.dart';
import 'package:ecart/widgets/app_column.dart';
import 'package:ecart/widgets/big_text.dart';
import 'package:ecart/widgets/icon_and_text_widget.dart';
import 'package:ecart/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:ecart/Controllers/popular_product_controller.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => FoodPageBodyState();
}

class FoodPageBodyState extends State<FoodPageBody> {
  PageController pagecontroller = PageController(viewportFraction: 0.9);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pagecontroller.addListener(() {
      setState(() {
        _currPageValue = pagecontroller.page!;
        //print("Current page value is:" + _currPageValue.toString());
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pagecontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return popularProducts.isLoaded
              // Horizontally scrollable part of the home page
              ? Container(
                  //color: Colors.red,
                  height: Dimensions.pageView,

                  child: PageView.builder(
                      controller: pagecontroller,
                      itemCount: popularProducts.popularProductList.length,
                      itemBuilder: (context, position) {
                        return _buildPageItem(position,
                            popularProducts.popularProductList[position]);
                      }),
                )
              : CircularProgressIndicator(
                  color: AppColors.mainColor,
                );
        }),
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          // Scrolling dots
          return DotsIndicator(
              //Data Takes time to load so Dot Indicator will give an error
              //we will make some changes to correct this error
              dotsCount: popularProducts.popularProductList.isEmpty
                  ? 1
                  : popularProducts.popularProductList.length,
              position: _currPageValue,
              decorator: DotsDecorator(
                activeColor: AppColors.mainColor,
                size: const Size.square(9.0),
                activeSize: const Size(18.0, 9.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ));
        }),
// Popular text
        SizedBox(height: Dimensions.height20),
        // Recommended Section
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Recommended"),
              SizedBox(
                width: Dimensions.width10,
              ),
              Container(
                  margin: const EdgeInsets.only(bottom: 3),
                  child: BigText(
                    text: ".",
                    color: Colors.black26,
                  )),
              SizedBox(
                width: Dimensions.width10,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: SmallText(text: "Food pairing"),
              )
            ],
          ),
        ),
        GetBuilder<RecommendedProductController>(
            builder: (recommendedProducts) {
          return recommendedProducts.isLoaded
              //Recommended Food
              // Vertically Scrollable List builder
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  //physics: AlwaysScrollableScrollPhysics(),
                  //parent container of a listviewbuilder should have a height If we remove that it will give an error
                  itemCount: recommendedProducts.recommendedProductList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteHelper.getrecommendedFood(index));
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            bottom: Dimensions.height10,
                            left: Dimensions.width20,
                            right: Dimensions.width20),
                        child: Row(
                          children: [
                            Container(
                              width: Dimensions.listViewImgSize,
                              height: Dimensions.listViewImgSize,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radius20),
                                  color: Colors.white38,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: //AssetImage("assets/Images/pulao.jpg")
                                          NetworkImage(AppConstants.BASE_URL +
                                              AppConstants.UPLOAD_CONSTANT +
                                              recommendedProducts
                                                  .recommendedProductList[index]
                                                  .img!))),
                            ),
                            //Text Section
                            Expanded(
                              child: Container(
                                height: Dimensions.listViewTextContSize,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topRight:
                                          Radius.circular(Dimensions.radius20),
                                      bottomRight:
                                          Radius.circular(Dimensions.radius20),
                                    )),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      right: Dimensions.height10,
                                      left: Dimensions.width10),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        BigText(
                                            text: recommendedProducts
                                                .recommendedProductList[index]
                                                .name!),
                                        SizedBox(height: Dimensions.height10),
                                        SmallText(text: "Do it later"),
                                        SizedBox(height: Dimensions.height10),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            IconAndTextWidget(
                                              icon: Icons.circle_sharp,
                                              text: "Normal",
                                              iconColor: AppColors.iconColor1,
                                              space: 0,
                                            ),
                                            IconAndTextWidget(
                                              icon: Icons.location_on,
                                              text: "1.7Km",
                                              iconColor: AppColors.mainColor,
                                              space: 0,
                                            ),
                                            IconAndTextWidget(
                                              icon: Icons.access_time_rounded,
                                              text: "32min",
                                              iconColor: AppColors.iconsColor2,
                                              space: 0,
                                            )
                                          ],
                                        )
                                      ]),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  })
              : CircularProgressIndicator(
                  color: AppColors.mainColor,
                );
        })
      ],
    );
  }

//Here We have passed PopularProductModel and not Popular Product i.e. Elements of List

  Widget _buildPageItem(int index, ProductsModel popularProducts) {
    //------For Transition effects while Sliding the top of the page-------------------------//
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;

      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }
    //---------------------------------------------------------------------------------------//

    return Transform(
      transform: matrix,
      child: Stack(children: [
        // Dish Photo
        GestureDetector(
          onTap: () {
            Get.toNamed(RouteHelper.getpopularFood(index));
          },
          child: Container(
              height: Dimensions.pageViewContainer,
              margin: EdgeInsets.only(
                  left: Dimensions.width10, right: Dimensions.width10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  color: index.isEven ? Color(0xFF69c5df) : Color(0xff9294cc),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      //Image is broken in to several parts so we connect that with base url
                      image: NetworkImage(AppConstants.BASE_URL +
                          "/uploads/" +
                          popularProducts.img!)))),
        ),
        // Aligning the Smaller Box on the popular Dish Image Section
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
              height: Dimensions.pageTextContainer,
              margin: EdgeInsets.only(
                  left: Dimensions.width30,
                  right: Dimensions.width30,
                  bottom: Dimensions.height20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xFFe8e8e8),
                        blurRadius: 5.0,
                        offset: Offset(0, 5)),
                    BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                    BoxShadow(color: Colors.white, offset: Offset(5, 0))
                  ]),
              child: Container(
                  padding: EdgeInsets.only(
                      left: Dimensions.width15,
                      right: Dimensions.width15,
                      top: Dimensions.height15),
                  // Dish Name
                  child: AppColumn(
                    text: popularProducts.name!,
                  ))),
        ),
      ]),
    );
  }
}
