import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:system_analysis_and_design_project/app/routes/routes.dart';
import 'package:get/get.dart';
import 'app/routes/pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await FlutterDownloader.initialize(
      debug: false, // optional: set to false to disable printing logs to console (default: true)
      ignoreSsl: true // option: set to false to disable working with http links (default: false)
  );
  // await initServices();
  runApp(
    GetMaterialApp(
      initialRoute: Routes.SPLASH_SCREEN,
      // initialRoute: Routes.HOME,
      getPages: AppPages.pages,
      builder: EasyLoading.init(),
      theme: ThemeData(
        fontFamily: 'Lato',
        primaryColor: Color(0xff115046),
        cardColor: Color(0xffE1E1E1),
        hintColor: Color(0xff5BC2AA),
        hoverColor: Color(0xffD1F5F0),
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}

// Future<void> initServices() async {
//   await InitService().init();
// }
