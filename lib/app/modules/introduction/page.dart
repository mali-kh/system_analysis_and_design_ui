// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:introduction_screen/introduction_screen.dart';
// import 'package:system_analysis_and_design_project/app/core/values/strings.dart';
// import '../../routes/routes.dart';
//
// class IntroPage extends StatelessWidget {
//   const IntroPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return IntroductionScreen(
//       pages: [
//         PageViewModel(
//           title: Strings.INTRO_TITLE,
//           bodyWidget: Stack(
//             children: [
//               Container(
//                 width: double.infinity,
//                 height: 100,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(30),
//                     topRight: Radius.circular(30),
//                   ),
//                   gradient: LinearGradient(
//                     colors: [Color.fromRGBO(217, 15, 15, 1), Color.fromRGBO(217, 15, 15, 0)],
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//       showNextButton: false,
//       showBackButton: false,
//       showSkipButton: true,
//       skip: const Text("Skip"),
//       done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
//       onDone: () {
//         Get.offAllNamed(Routes.USERNAME);
//         // When done button is press
//       },
//     );
//   }
// }

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:system_analysis_and_design_project/app/core/values/strings.dart';
import 'package:system_analysis_and_design_project/app/global_widgets/buttons.dart';
import 'package:system_analysis_and_design_project/app/modules/introduction/local_widgets/layers.dart';
import 'package:get/get.dart';
import 'package:system_analysis_and_design_project/app/routes/routes.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20, top: MediaQuery.of(context).size.width / 8),
              child: Text(
                Strings.INTRO_TITLE,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ColorLayer(
              width: MediaQuery.of(context).size.width / 4,
              topMargin: MediaQuery.of(context).size.height / 8,
              height: 40,
              topLeftRadius: 30,
              topRightRadius: 30,
              startColor: Color.fromRGBO(217, 15, 15, 1),
              endColor: Color.fromRGBO(217, 15, 15, 0),
            ),
            ColorLayer(
              width: double.infinity,
              topMargin: (MediaQuery.of(context).size.height / 8) + 30,
              height: 80,
              topLeftRadius: 30,
              topRightRadius: 30,
              startColor: Color.fromRGBO(217, 15, 15, 1),
              endColor: Color.fromRGBO(217, 15, 15, 0),
            ),
            ColorLayer(
              width: MediaQuery.of(context).size.width / 4,
              topMargin: (MediaQuery.of(context).size.height / 8) + 30 + 50,
              height: 40,
              topLeftRadius: 30,
              topRightRadius: 30,
              startColor: Color.fromRGBO(251, 173, 22, 1),
              endColor: Color.fromRGBO(251, 173, 22, 0),
            ),
            ColorLayer(
              width: double.infinity,
              topMargin: (MediaQuery.of(context).size.height / 8) + 30 + 50 + 30,
              height: 80,
              topLeftRadius: 30,
              topRightRadius: 30,
              startColor: Color.fromRGBO(251, 173, 22, 1),
              endColor: Color.fromRGBO(251, 173, 22, 0),
            ),
            ColorLayer(
              width: MediaQuery.of(context).size.width / 4,
              topMargin: (MediaQuery.of(context).size.height / 8) + 30 + 50 + 30 + 50,
              height: 40,
              topLeftRadius: 30,
              topRightRadius: 30,
              startColor: Color.fromRGBO(35, 163, 144, 1),
              endColor: Color.fromRGBO(35, 163, 144, 0),
            ),
            ColorLayer(
              width: double.infinity,
              topMargin: (MediaQuery.of(context).size.height / 8) + 30 + 50 + 30 + 50 + 30,
              height: double.infinity,
              topLeftRadius: 30,
              topRightRadius: 30,
              startColor: Color.fromRGBO(35, 163, 144, 1),
              endColor: Color.fromRGBO(35, 163, 144, 1),
            ),
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * (7 / 10), left: 20, right: 60),
              child: AutoSizeText(
                Strings.INTRO_DESCRIPTION,
                style: TextStyle(
                  fontSize: 100,
                  color: Colors.white,
                ),
                maxLines: 1,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * (7 / 10) + 50, left: 20, right: 120),
              child: AutoSizeText(
                Strings.INTRO_AFFILIATION,
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
                maxLines: 1,
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 30, bottom: 30),
                  child: SadButton(
                    title: Strings.GET_STARTED,
                    onTap: () {
                      Get.offAllNamed(Routes.USERNAME);
                    },
                    color: Color.fromRGBO(17, 80, 70, 1),
                    textColor: Colors.white,
                    width: 120,
                    height: 35,
                    borderRadius: 15,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
