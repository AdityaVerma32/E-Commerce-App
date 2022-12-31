import 'package:ecart/Pages/food/popular_food_details.dart';
import 'package:ecart/Pages/food/recommened_food_details.dart';
import 'package:ecart/Pages/home/main_food_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initial = "/";
  static const popularFood = "/popular-food";
  static const recommendedFood = "/recommended-food";

  static String getInitial() => '$initial';
  static String getpopularFood(int pageId) => '$popularFood?pageId=$pageId';
  static String getrecommendedFood(int pageId) =>
      '$recommendedFood?pageId=$pageId';

  static List<GetPage> routes = [
    GetPage(name: "/", page: () => MainFoodPage()),
    GetPage(
        name: popularFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          print("Popular Food get Called");
          return PopularFoodDetails(pageId: int.parse(pageId!));
        },
        transition: Transition.fadeIn),
    GetPage(
        name: recommendedFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          print("Recommended Food get Called");
          return RecommenedFoodDetails(pageId: int.parse(pageId!));
        },
        transition: Transition.fadeIn)
  ];
}
