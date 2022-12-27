import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

// page view container is for sliding part of the home page
  static double pageViewContainer = screenHeight / 3.65; //  803/220
  static double pageTextContainer = screenHeight / 6.69; // 803/120
  static double pageView = screenHeight / 2.5; // 803/320

//dynamic height
  static double height10 = screenHeight / 80.3; // 803/10
  static double height20 = screenHeight / 40.15; // 803/20
  static double height15 = screenHeight / 53.53; // 803/15
  static double height50 = screenHeight / 16.06;
  static double height45 = screenHeight / 17.84;
//dynamic width
  static double width10 = screenHeight / 80.3; // 803/10
  static double width20 = screenHeight / 40.15; // 803/20
  static double width15 = screenHeight / 53.53; // 803/15
  static double width30 = screenHeight / 26.76;

  static double font20 = screenHeight / 40.15;
  static double radius20 = screenHeight / 40.15;
  static double radius30 = screenHeight / 26.76;
  static double radius15 = screenHeight / 53.53;

  //ICON size

  static double iconsize24 =
      screenHeight / 33.45; // 803/24 24 is the default size of icon
}
