import 'dart:async';

import 'package:get/get.dart';

class MyRecipesController extends GetxController {

  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    Timer(const Duration(milliseconds: 300), () => isLoading.value = false);
  }

  @override
  void onClose() {
    super.onClose();
  }

}
