import 'package:cook_app/app/data/utils.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopScope(
        canPop: false,
        child: Container(
          color: Utils.mainBgColor,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(
                  () => AnimatedContainer(
                      duration: Utils.textPopUpDuration,
                      width: 200,
                      height: 200,
                      margin: EdgeInsets.only(
                          bottom:
                              controller.marginAppFontSize.value.toDouble()),
                      child: Lottie.asset('assets/Splash.json', repeat: false)),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(() => AnimatedDefaultTextStyle(
                          duration: Utils.textPopUpDuration,
                          style: TextStyle(
                              fontSize:
                                  controller.frontAppFontSize.value.toDouble() *
                                      3,
                              fontFamily: 'Heavitas',
                              fontWeight: FontWeight.bold,
                              color: Utils.mainColor),
                          child: const Text("C"),
                        )),
                    Obx(() => AnimatedDefaultTextStyle(
                          duration: Utils.textPopUpDuration,
                          style: TextStyle(
                              fontSize:
                                  controller.appFontSize.value.toDouble() * 3,
                              fontFamily: 'Heavitas',
                              color: Utils.mainColor),
                          child: const Text("ook APP"),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
