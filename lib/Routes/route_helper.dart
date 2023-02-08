import 'package:ecart/Pages/Splash/splash_screen.dart';
import 'package:ecart/Pages/cart/cart_page.dart';
import 'package:ecart/Pages/food/popular_food_details.dart';
import 'package:ecart/Pages/food/recommened_food_details.dart';
import 'package:ecart/Pages/home/main_food_page.dart';
import 'package:get/get.dart';

import '../Pages/home/home_page.dart';

class RouteHelper {
  static const String splashPage = "/splash-page";
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String cartpage = "/cart-page";

  static String getSplashPage() => '$splashPage';
  static String getInitial() => '$initial';
  static String getpopularFood(int pageId, String page) =>
      '$popularFood?pageId=$pageId&page=$page';
  static String getrecommendedFood(int pageId, String page) =>
      '$recommendedFood?pageId=$pageId&page=$page';
  static String getcartPage() => '$cartpage';

  static List<GetPage> routes = [
    GetPage(name: splashPage, page: () => SplashScreen()),
    GetPage(name: initial, page: () => HomePage()),
    GetPage(
        name: popularFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters["page"];
          //print("Popular Food get Called");
          return PopularFoodDetails(pageId: int.parse(pageId!), page: page!);
        },
        transition: Transition.fadeIn),
    GetPage(
        name: recommendedFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters["page"];
          //print("Recommended Food get Called");
          return RecommenedFoodDetails(pageId: int.parse(pageId!), page: page!);
        },
        transition: Transition.fadeIn),
    GetPage(
        name: cartpage,
        page: () {
          return CartPage();
        },
        transition: Transition.fadeIn)
  ];
}
