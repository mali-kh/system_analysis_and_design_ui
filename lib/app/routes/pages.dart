import '../modules/home/page.dart';
import '../modules/introduction/page.dart';
import '../modules/login/page.dart';
import '../modules/register/page.dart';
import '../modules/splash_screen/page.dart';
import '../modules/username/page.dart';
import '../routes/routes.dart';

import 'package:get/get_navigation/src/routes/get_route.dart';

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
