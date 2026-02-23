import 'dart:async';

import 'package:cook_app/app/data/utils.dart';
import 'package:cook_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  //TODO: Implement OpeningController

  var marginAppFontSize = 0.obs;
  var frontAppFontSize = 0.obs;
  var appFontSize = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    Timer(const Duration(seconds: 2), () => marginAppFontSize.value = 10);
    Timer(const Duration(seconds: 2), () => frontAppFontSize.value = Utils.appBarFontSize * 2);
    Timer(const Duration(seconds: 2), () => appFontSize.value = Utils.appBarFontSize);
    Timer(const Duration(milliseconds: 3500), () => Get.offNamed(Routes.HOME));
  }

  @override
  void onClose() {
    super.onClose();
  }

}
