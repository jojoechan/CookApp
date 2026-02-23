import 'package:cook_app/app/data/home_drawer.dart';
import 'package:cook_app/app/data/loading_view.dart';
import 'package:cook_app/app/data/utils.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/my_recipes_controller.dart';

class MyRecipesView extends GetView<MyRecipesController> {
  const MyRecipesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyRecipesView'),
        centerTitle: true,
      ),
      drawer: HomeDrawer.build(),
      body: Obx(() =>
        LoadingView.build(
          isLoading: controller.isLoading.value,
          isShowContentOnLoading: false,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 200,
                  height: 200,
                  child: Lottie.asset('assets/EmptyRecipes.json')
                ),
                Text("Whoops, your recipes are still empty.\nTry to create more!", 
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: Utils.mainFontSize.toDouble(),
                  ),
                ),
              ],
            )
          )
        ),
      ),
    );
  }
}
