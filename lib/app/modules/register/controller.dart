import 'package:get/get.dart';
import 'package:system_analysis_and_design_project/app/data/domain/model/request/auth_requests.dart';
import 'package:system_analysis_and_design_project/app/data/domain/model/response/auth_reponses.dart';
import 'package:system_analysis_and_design_project/app/data/providers/storage_provider.dart';
import 'package:system_analysis_and_design_project/app/data/services/authentication/auth_service.dart';
import 'package:system_analysis_and_design_project/app/routes/routes.dart';

class RegisterController extends GetxController {
  String username = '';
  String firstName = '';
  String lastName = '';
  String password = '';
  String passwordRepeat = '';

  void navigate() {
    if (firstName.length > 0 && lastName.length > 0) {
      Get.toNamed(Routes.REGISTER_PASSWORD);
    }
  }

  void register() async {
    if (password.length > 0 && password == passwordRepeat) {
      try {
        LoginResponse response = await AuthService().register(RegisterRequest(username, password, firstName, lastName));
        if (response.code == "OK") {
          await StorageProvider.saveTokens(response.token.token, response.token.refreshToken);
          Get.toNamed(Routes.HOME);
        }
      } catch (e) {}
    }
  }
}
