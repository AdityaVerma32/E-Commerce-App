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
      print("Could not fetch Data");
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  void updateHeader(String token) {
    _mainHeader = {
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    };
  }

  // When Building Sign In And sign Up pages
  // Posting User credentials to server
  Future<Response> postdata(String uri, dynamic body) async {
    // token variable is used to post data
    try {
      Response response = await post(uri, body, headers: _mainHeader);
      return response;
    } catch (e) {
      print(e.toString());
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
