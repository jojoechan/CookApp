import 'package:get/get.dart';

import '../controllers/recipes_list_controller.dart';

class RecipesListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RecipesListController>(
      () => RecipesListController(),
    );
  }
}
