// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FABController extends GetxController {
  late bool open = false;
  // late final AnimationController animationController;
  // void initializeAnimationController(AnimationController animationController) {
  //   this.animationController = animationController;
  // }

  void changeOpen(bool open) {
    open = open;
    update();
  }

  void toggleOpen() {
    open = !open;
    update();
  }

  // void toggleKhodemoon() {
  //   toggleOpen();
  //   if (open) {
  //     animationController.forward();
  //   } else {
  //     animationController.reverse();
  //   }
  //   update();
  // }

  // void animationForward() {
  //   animationController.forward();
  //   update();
  // }

  // void animationForward() {
  //   animationController.forward();
  //   update();
  // }
}
