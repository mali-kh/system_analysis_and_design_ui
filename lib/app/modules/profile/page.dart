import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:system_analysis_and_design_project/app/core/values/strings.dart';
import 'package:system_analysis_and_design_project/app/data/providers/storage_provider.dart';
import 'package:system_analysis_and_design_project/app/global_widgets/custom_icons.dart';
import 'package:system_analysis_and_design_project/app/modules/home/controller.dart';
import 'package:system_analysis_and_design_project/app/modules/profile/local_widgets/custom_icon_button.dart';
import 'package:system_analysis_and_design_project/app/modules/profile/local_widgets/info_dialog.dart';
import 'package:system_analysis_and_design_project/app/routes/routes.dart';

class ProfilePage extends StatelessWidget {
  void showTeamInfoDialog(BuildContext context, ThemeData theme) {
    showDialog(
      context: context,
      builder: (context) {
        return TeamInfoDialog(
          theme: theme,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    HomePageController homePageController = Get.find();
    final mq = MediaQuery.of(context);
    final theme = Theme.of(context);
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(
              'assets/svgs/raining_leaf.svg',
              height: 120,
            ),
          ),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Stack(
                      children: [
                        Align(
                          child: Column(
                            children: [
                              Hero(
                                tag: "Pic",
                                child: CircleAvatar(
                                  backgroundImage: AssetImage('assets/images/sample_profile.jpg'),
                                  minRadius: mq.size.width * 0.175,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Column(
                                children: [
                                  Text(
                                    homePageController.firstName.value,
                                    style: TextStyle(
                                      color: theme.primaryColor,
                                      fontSize: 23,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    homePageController.lastName.value,
                                    style: TextStyle(
                                      color: theme.primaryColor,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          left: 0,
                          top: 0,
                          child: GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () => Get.back(),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.chevron_left,
                                  color: theme.primaryColor,
                                  size: 30,
                                ),
                                Text(
                                  "Home Page",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: theme.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SvgPicture.asset(
                            "assets/svgs/profile_infos.svg",
                            height: mq.size.height * 0.15,
                          ),

                          // SizedBox(width: mq.size.width * 0.1,),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: mq.size.width * 0.075,
                              vertical: 10,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  // crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Icon(
                                      CustomIcons.lock,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      '*' * 10,
                                    ),
                                  ],
                                ),
                                Row(
                                  // crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Icon(
                                      CustomIcons.mail,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      homePageController.username.value,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: mq.size.width * 0.07,
                        vertical: 0,
                      ),
                      child: Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: theme.cardColor,
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    CustomIcons.info_i,
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    "Learn more about this project.",
                                    style: TextStyle(fontSize: 12),
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                              CustomIconButton(
                                theme: theme,
                                width: 110,
                                height: 40,
                                borderRadius: 10,
                                iconSize: 20,
                                icon: FontAwesomeIcons.solidFaceSmile,
                                iconColor: Colors.white,
                                textColor: Colors.white,
                                buttonColor: theme.primaryColor,
                                onTap: () => showTeamInfoDialog(
                                  context,
                                  theme,
                                ),
                                buttonText: Strings.CLICKME,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Stack(
                      // fit: StackFit.expand,
                      children: [
                        SvgPicture.asset(
                          'assets/svgs/libraries_background.svg',
                          width: double.infinity,
                          color: Color(0xff5BC2AA),
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.center,
                            child: Material(
                              elevation: 3,
                              borderRadius: BorderRadius.circular(7),
                              child: CustomIconButton(
                                theme: theme,
                                width: 120,
                                height: 50,
                                borderRadius: 7,
                                iconSize: 25,
                                icon: CustomIcons.logout,
                                iconColor: Colors.red,
                                textColor: Colors.red,
                                buttonColor: Colors.red.withAlpha(90),
                                buttonText: "Logout",
                                onTap: () async {
                                  //TODO: logout
                                  await StorageProvider.deleteTokens();
                                  Get.offAllNamed(Routes.SPLASH_SCREEN);
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
