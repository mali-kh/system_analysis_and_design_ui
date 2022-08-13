import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';
import 'package:system_analysis_and_design_project/app/data/providers/storage_provider.dart';
import 'package:system_analysis_and_design_project/app/routes/routes.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _initialChecks();
  }

  void _initialChecks() async {
    String? accessToken = await StorageProvider.getAccessToken();
    print(accessToken);
    if (accessToken == null)
      Get.offAllNamed(Routes.INTRO);
    else
      Get.offAllNamed(Routes.HOME);
  }

  void _navigate() {
    Get.offAllNamed(Routes.INTRO);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Lottie.asset(
            'assets/lotties/initial_loading.json',
            controller: _controller,
            onLoaded: (composition) {
              _controller..duration = composition.duration;
              // ..forward().whenComplete(() => _navigate());
            },
            repeat: true,
          ),
        ),
      ),
    );
  }
}
