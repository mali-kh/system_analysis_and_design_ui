import 'package:get/get.dart';
import 'package:system_analysis_and_design_project/app/data/domain/model/request/auth_requests.dart';
import 'package:system_analysis_and_design_project/app/data/domain/model/response/auth_reponses.dart';
import 'package:system_analysis_and_design_project/app/data/providers/storage_provider.dart';
import 'package:system_analysis_and_design_project/app/data/services/authentication/auth_service.dart';
import 'package:system_analysis_and_design_project/app/routes/routes.dart';

class LoginController extends GetxController {
  String username = '';
  String password = '';


  LoginController(this.username);

  void login() async {
    if (username.length > 0 && password.length > 0) {
      try {
        LoginResponse response = await AuthService().login(LoginRequest(username, password));
        if (response.code == "OK") {
          await StorageProvider.saveTokens(response.token.token, response.token.refreshToken);
          Get.toNamed(Routes.HOME);
        }
      } catch (e) {}
    }
  }
}
