import 'package:get/get.dart';

import '../controllers/likes_controller.dart';

class LikesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LikesController>(
      () => LikesController(),
    );
  }
}
