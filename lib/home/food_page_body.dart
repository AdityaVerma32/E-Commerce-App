import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecart/utils/app_colors.dart';
import 'package:ecart/utils/dimensions.dart';
import 'package:ecart/widgets/big_text.dart';
import 'package:ecart/widgets/icon_and_text_widget.dart';
import 'package:ecart/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

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
        Container(
          //color: Colors.red,
          height: Dimensions.pageView,
          child: PageView.builder(
              controller: pagecontroller,
              itemCount: 5,
              itemBuilder: (context, position) {
                return _buildPageItem(position);
              }),
        ),
        new DotsIndicator(
          dotsCount: 5,
          position: _currPageValue,
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        )
      ],
    );
  }

  Widget _buildPageItem(int index) {
    //---------For Transition while Sliding the top of the page------------------------------//
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
        Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(
                left: Dimensions.width10, right: Dimensions.width10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: index.isEven ? Color(0xFF69c5df) : Color(0xff9294cc),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/Images/pulao.jpg")))),
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
                    left: Dimensions.height15, right: 15, top: 15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(text: "Veg. Pulao"),
                      SizedBox(height: Dimensions.height10),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(
                                5,
                                (index) => Icon(
                                      Icons.star,
                                      color: AppColors.mainColor,
                                      size: 13,
                                    )),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          SmallText(
                            text: "4.5",
                            //size: 15,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          SmallText(
                            text: "1287",
                            //size: 15,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          SmallText(
                            text: "comments",
                            //size: 15,
                          )
                        ],
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconAndTextWidget(
                              icon: Icons.circle_sharp,
                              text: "Normal",
                              iconColor: AppColors.iconColor1),
                          IconAndTextWidget(
                              icon: Icons.location_on,
                              text: "1.7Km",
                              iconColor: AppColors.mainColor),
                          IconAndTextWidget(
                              icon: Icons.access_time_rounded,
                              text: "Normal",
                              iconColor: AppColors.iconsColor2)
                        ],
                      )
                    ]),
              )),
        ),
      ]),
    );
  }
}
