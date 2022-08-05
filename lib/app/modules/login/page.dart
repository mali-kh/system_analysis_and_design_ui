import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:system_analysis_and_design_project/app/global_widgets/buttons.dart';
import 'package:system_analysis_and_design_project/app/global_widgets/text_fileds.dart';
import 'package:system_analysis_and_design_project/app/modules/login/controller.dart';
import 'package:system_analysis_and_design_project/app/routes/routes.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController());

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40, top: 20),
                  child: Text(
                    'password',
                  ),
                ),
                CommonPasswordField(
                  onChanged: (value) {
                    // controller.username = value;
                  },
                ),
                CommonButton(
                  name: 'login',
                  onTap: () {
                    Get.toNamed(Routes.HOME);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
