import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:system_analysis_and_design_project/app/modules/splash_screen/page.dart';
import 'package:system_analysis_and_design_project/app/routes/routes.dart';

import 'app/routes/pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await initServices();
  runApp(
    GetMaterialApp(
      // theme: ,
      initialRoute: Routes.SPLASH_SCREEN,
      getPages: AppPages.pages,
      builder: EasyLoading.init(),
    ),
  );
}

// Future<void> initServices() async {
//   await InitService().init();
// }
