import 'package:ecart/utils/app_constants.dart';
import 'package:get/get.dart';

class Apiclient extends GetConnect implements GetxService {
  late String token;
  final String appBaseurl;
  late Map<String, String> _mainHeader;
  Apiclient({required this.appBaseurl}) {
    baseUrl = appBaseurl;
    timeout = Duration(seconds: 30);
    token = AppConstants.APP_TOKEN;
    _mainHeader = {
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    };
  }
  Future<Response> getData(String uri) async {
    try {
      Response response = await get(uri);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
