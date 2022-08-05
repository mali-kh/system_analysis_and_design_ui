import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:system_analysis_and_design_project/app/global_widgets/buttons.dart';
import 'package:system_analysis_and_design_project/app/global_widgets/text_fileds.dart';
import 'package:system_analysis_and_design_project/app/modules/username/controller.dart';
import 'package:get/get.dart';
import 'package:system_analysis_and_design_project/app/routes/routes.dart';

class UsernamePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UsernameController controller = Get.put(UsernameController());

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
                    'email',
                  ),
                ),
                CommonTextField(
                  onChanged: (value) {
                    controller.username = value;
                  },
                ),
                CommonButton(
                  name: 'login',
                  onTap: () {
                    Get.toNamed(Routes.LOGIN);
                  },
                ),
                CommonButton(
                  name: 'register',
                  onTap: () {
                    Get.toNamed(Routes.REGISTER);
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
