import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

// page view container is for sliding part of the home page
  static double pageViewContainer = screenHeight / 3.65; //  803/220
  static double pageTextContainer = screenHeight / 6.69; // 803/120
  static double pageView = screenHeight / 2.5; // 803/320

//Bottom height

  static double bottomheight120 = screenHeight / 6.69;
//dynamic height
  static double height10 = screenHeight / 80.3; // 803/10
  static double height20 = screenHeight / 40.15; // 803/20
  static double height15 = screenHeight / 53.53; // 803/15
  static double height50 = screenHeight / 16.06;
  static double height30 = screenHeight / 26.76;
  static double height45 = screenHeight / 17.84;
//dynamic width
  static double width10 = screenHeight / 80.3; // 803/10
  static double width20 = screenHeight / 40.15; // 803/20
  static double width15 = screenHeight / 53.53; // 803/15
  static double width30 = screenHeight / 26.76;
// font sizes
  static double font20 = screenHeight / 40.15;
  static double font26 = screenHeight / 30.88;

//radius sizes

  static double radius20 = screenHeight / 40.15;
  static double radius30 = screenHeight / 26.76;
  static double radius15 = screenHeight / 53.53;

  //ICON size

  static double iconsize14 = screenHeight / 57.57;
  static double iconsize24 =
      screenHeight / 33.45; // 803/24 24 is the default size of icon
  static double iconsize16 = screenHeight / 50.18; // 803/16

  // List View size
  static double listViewTextContSize = screenWidth / 3.92; // 392/100
  static double listViewImgSize = screenWidth / 3.26; // 392/120

  //popular Food
  static double PopularFoodImgSize = screenHeight / 2.29; //803/350

  // Splash Screen
  static double splashImg = screenHeight / 4.08;
}
