import 'package:cook_app/app/data/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomImageNetwork {
  static Widget build(String imageUrl, {required bool equalSize, bool withBorderRadius = false, BorderRadius? customBorderRadius, double? fontSize, double? reloadFontSize}){
    return !equalSize 
    ? getImageNetwork(imageUrl, withBorderRadius, customBorderRadius, fontSize, reloadFontSize)
    : AspectRatio(
      aspectRatio: 1,
      child: getImageNetwork(imageUrl, withBorderRadius, customBorderRadius, fontSize, reloadFontSize)
    );
  }

  static Widget getImageNetwork(String url, bool withBorderRadius, BorderRadius? customBorderRadius, double? fontSize, double? reloadFontSize){
    var imageUrl = "".obs;
    imageUrl.value = url;

    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
        borderRadius: customBorderRadius ?? BorderRadius.circular(withBorderRadius 
          ? Utils.defaultBorderRadius.toDouble() 
          : 0),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomRight,
          stops: [
            0,
            0.8,
            0.9
          ],
          colors: [
            Utils.mainHoverBgColor,
            Utils.mainColor,
            Utils.mainColor
          ]
        )
      ),
      child: ClipRRect(
        borderRadius: customBorderRadius ?? BorderRadius.circular(withBorderRadius 
          ? Utils.defaultBorderRadius.toDouble() 
          : 0),
        child: Obx(()=>
          Image.network(
            key: ValueKey(imageUrl.value),
            fit: BoxFit.cover,
            imageUrl.value,
            errorBuilder: (context, error, stackTrace) {
              return GestureDetector(
                onTap: () {
                  imageUrl.value = url;
                },
                child: Container(
                  padding: EdgeInsets.all(Utils.defaultBorderRadius.toDouble() / 2),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Tap to Reload.", 
                          textAlign: TextAlign.center, 
                          style: TextStyle(
                            color: Utils.imageErrorTextColor,
                            fontSize: fontSize ?? Utils.smallFontSize.toDouble(),
                            fontWeight: FontWeight.bold
                          )
                        ),
                        Text("↻", 
                          textAlign: TextAlign.center, 
                          style: TextStyle(
                            color: Utils.imageErrorTextColor,
                            fontSize: reloadFontSize ?? Utils.bigFontSize.toDouble(),
                            fontWeight: FontWeight.bold
                          )
                        ),
                      ],
                    )
                  ),
                ),
              );
            },
            loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
              if(loadingProgress == null) return child;
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                    : null,
                    color: Utils.mainColor,
                )
              );
            },
          ),
        )
      )
    );
  }
}