import 'package:get/get.dart';
import 'package:system_analysis_and_design_project/app/data/domain/model/request/auth_requests.dart';
import 'package:system_analysis_and_design_project/app/data/domain/model/response/auth_reponses.dart';
import 'package:system_analysis_and_design_project/app/data/services/authentication/auth_service.dart';
import 'package:system_analysis_and_design_project/app/routes/routes.dart';

class UsernameController extends GetxController {
  String username = '';

  void checkUsername() async {
    // if (username.length > 0) {
    //   try {
    //     CheckUsernameResponse response = await AuthService().checkUsername(CheckUsernameRequest(username));
    //     if (response.exist) {
    //       Get.toNamed(Routes.LOGIN);
    //     } else {
    //       Get.toNamed(Routes.REGISTER);
    //     }
    //   } catch (e) {}
    // }
  }
}
