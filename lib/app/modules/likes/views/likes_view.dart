import 'package:cook_app/app/data/home_drawer.dart';
import 'package:cook_app/app/data/loading_view.dart';
import 'package:cook_app/app/data/utils.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/likes_controller.dart';

class LikesView extends GetView<LikesController> {
  const LikesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Utils.mainColor,
        title: Text('Likes', style: TextStyle(color: Utils.altTextColor, fontFamily: 'Heavitas')),
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
                  child: Lottie.asset('assets/EmptyLikes.json')
                ),
                Text("Seems like you need spread more likes.", 
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
