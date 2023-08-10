import 'package:ecart/MOdels/response_model.dart';
import 'package:ecart/MOdels/sign_up_model.dart';
import 'package:ecart/data/Repositories/auth_repo.dart';
import 'package:get/get.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;
  AuthController({required this.authRepo});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<ResponseModel> registraton(SignUpBody) async {
    _isLoading = true;
    Response response = await authRepo.registration(SignUpBody);
    late ResponseModel responseModel;
    if (response.statusCode == 200) {
      authRepo.saveUserToken(response.body["token"]);
      responseModel = ResponseModel(true, response.body["Token"]);
    } else {
      responseModel = ResponseModel(false, response.statusText!);
    }

    _isLoading = true;
    update();
    return responseModel;
  }
}
