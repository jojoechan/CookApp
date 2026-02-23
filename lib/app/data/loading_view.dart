import 'package:cook_app/app/data/utils.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingView {
  static Widget build ({required Widget child, required bool isLoading, required bool isShowContentOnLoading}) {
    return PopScope(
      canPop: !isLoading,
      child: Stack(
        children: [
          !isLoading ? const SizedBox.shrink() : Container(
            color: Utils.loadingBgColor,
            child: Center(
              child: SizedBox(
                width: 200,
                height: 200,
                child: Lottie.asset('assets/Loading.json'),
              ),
            ),
          ),
          !isShowContentOnLoading && isLoading ? const SizedBox.shrink() : child
        ],
      ),
    );
  }
}