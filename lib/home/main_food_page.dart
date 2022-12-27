import 'dart:ffi';

import 'package:ecart/home/food_page_body.dart';
import 'package:ecart/utils/app_colors.dart';
import 'package:ecart/utils/dimensions.dart';
import 'package:ecart/widgets/big_text.dart';
import 'package:ecart/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    print("Current height is " + MediaQuery.of(context).size.height.toString());
    print("Current width is " + MediaQuery.of(context).size.width.toString());
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Container(
              margin: EdgeInsets.only(top: Dimensions.height50),
              padding: EdgeInsets.only(
                  left: Dimensions.width15, right: Dimensions.width15),

// App Bar
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(
                        text: "Bangladesh",
                        color: AppColors.mainColor,
                      ),
                      Row(
                        children: [
                          SmallText(
                            text: "city",
                            color: Colors.black54,
                          ),
                          Icon(Icons.arrow_drop_down)
                        ],
                      )
                    ],
                  ),
                  Container(
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: Dimensions.iconsize24,
                    ),
                    width: Dimensions.height45,
                    height: Dimensions.height45,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius15),
                        color: AppColors.mainColor),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(child: SingleChildScrollView(child: FoodPageBody()))
        ],
      ),
    );
  }
}
