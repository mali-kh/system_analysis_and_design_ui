import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:system_analysis_and_design_project/app/modules/home/page.dart';
import 'package:system_analysis_and_design_project/app/modules/introduction/page.dart';
import 'package:system_analysis_and_design_project/app/modules/login/page.dart';
import 'package:system_analysis_and_design_project/app/modules/register/page.dart';
import 'package:system_analysis_and_design_project/app/modules/splash_screen/page.dart';
import 'package:system_analysis_and_design_project/app/modules/username/page.dart';
import 'package:system_analysis_and_design_project/app/routes/routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.SPLASH_SCREEN,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: Routes.INTRO,
      page: () => IntroPage(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
    ),
    GetPage(
      name: Routes.USERNAME,
      page: () => UsernamePage(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => RegisterPage(),
    ),
  ];
}
