import 'package:get/get.dart';

import '../controllers/my_recipes_controller.dart';

class MyRecipesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyRecipesController>(
      () => MyRecipesController(),
    );
  }
}
