import 'package:cook_app/app/data/text_to_speech.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  Get.put(TextToSpeech(), permanent: true);
  runApp(
    GetMaterialApp(
        title: "Cook APP",
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        debugShowCheckedModeBanner: false),
  );
}
