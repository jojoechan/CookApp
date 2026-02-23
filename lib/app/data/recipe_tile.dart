import 'package:cook_app/app/data/image_network.dart';
import 'package:cook_app/app/data/recipe_tile_data.dart';
import 'package:cook_app/app/data/utils.dart';
import 'package:cook_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class RecipeTile {

  static Widget build(RecipeTileData recipe, bool isSelected, Function() onTap, Function() onLongPress){
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8
      ),
      child: Center(
        child: Stack(
          children: [
            // Image on back
            AspectRatio(
              aspectRatio: 2,
              child: Container(
                width: double.infinity,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Utils.defaultBorderRadius.toDouble()),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 3,
                      offset: Offset(3, 3)
                    )
                  ]
                ),
                child: CustomImageNetwork.build(
                  recipe.image, 
                  equalSize: false,
                  customBorderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Utils.defaultBorderRadius.toDouble()),
                    bottomLeft: Radius.circular(Utils.defaultBorderRadius.toDouble()),
                    topRight: Radius.circular(Utils.defaultBorderRadius.toDouble() * 2),
                    bottomRight: Radius.circular(Utils.defaultBorderRadius.toDouble() * 2)
                  )
                )
              ),
            ),
        
            // Desc : Recipe data
            AspectRatio(
              aspectRatio: 2,
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Utils.defaultBorderRadius.toDouble()),
                  // Desc : Giving gradient so it can be readed
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    stops: [
                      0,
                      0.3,
                      0.8
                    ],
                    colors: [
                      Colors.transparent,
                      Colors.transparent,
                      Colors.black
                    ]
                  )
                ),
                width: double.infinity,
                alignment: Alignment.centerRight,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: Utils.defaultBorderRadius.toDouble(), vertical: Utils.defaultBorderRadius.toDouble() + 5),
                  width: 120,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      // Desc : Title
                      Text(recipe.title,
                        style: TextStyle(
                          color: Utils.mainTextColor, 
                          fontWeight: FontWeight.bold, 
                          fontSize: Utils.mainFontSize.toDouble()
                        ),
                        maxLines: 3,
                      ),
                      
                      SizedBox(
                        height: 5,
                      ),
                      
                      // Desc : Serving
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.person, color: Utils.mainTextColor,),
                          Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Text(recipe.serving.toString(),
                              style: TextStyle(
                                color: Utils.mainTextColor, 
                                fontSize: Utils.mainFontSize.toDouble()
                              ),
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                      
                      SizedBox(
                        height: 5,
                      ),
                      
                      // Desc : Preparation
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.timer_sharp, color: Utils.mainTextColor,),
                          Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Text(recipe.preparation,
                              style: TextStyle(
                                color: Utils.mainTextColor, 
                                fontSize: Utils.mainFontSize.toDouble()
                              ),
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                      
                    ],
                  ),
                )
              ),
            ),
            
            // Desc : On selected
            AspectRatio(
              aspectRatio: 2,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => onTap(),
                onLongPress: () => onLongPress(),
                child: AnimatedContainer(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Utils.defaultBorderRadius.toDouble()),
                    // Desc : Giving gradient so it can be readed
                    color: isSelected ? Utils.mainBgColor : Colors.transparent,
                    border: !isSelected ? null : Border.all(color: Utils.mainColor, width: 2),
                  ),
                  curve: Utils.textCurves,
                  width: double.infinity,
                  alignment: Alignment.centerRight,
                  duration: Utils.textPopUpDuration,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: Utils.defaultBorderRadius.toDouble(), vertical: Utils.defaultBorderRadius.toDouble() + 5),
                    width: double.infinity,
                    height: double.infinity,
                    child: !isSelected ? SizedBox.shrink() : Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Desc : Saved
                        Expanded(
                          child: Center(
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () => Get.toNamed(Routes.TUTORIAL, arguments: recipe),
                                onLongPress: (){},
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Icon(Icons.star, color: Utils.mainColor),
                                      Text("Saved", style: TextStyle(color: Utils.mainColor))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        
                        // Desc : Like
                        Expanded(
                          child: Center(
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () => Get.toNamed(Routes.TUTORIAL, arguments: recipe),
                                onLongPress: (){},
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Icon(Icons.thumb_up_alt_rounded, color: Utils.mainColor),
                                      Text("Like", style: TextStyle(color: Utils.mainColor))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        // Desc : Cook
                        Expanded(
                          child: Center(
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () => Get.toNamed(Routes.TUTORIAL, arguments: recipe),
                                onLongPress: (){},
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Icon(Icons.dinner_dining, color: Utils.mainColor),
                                      Text("Cook", style: TextStyle(color: Utils.mainColor))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ),
              ),
            ),
          
          ],
        ),
      ),
    );
  }

  static Widget shimmer(){
    return AspectRatio(
      aspectRatio: 2,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8
        ),
        width: double.infinity,
        // height: 150,
        alignment: Alignment.centerRight,
        child: Shimmer.fromColors(
          baseColor: Colors.grey[800]!,
          highlightColor: Colors.grey[700]!,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Utils.defaultBorderRadius.toDouble()),
                    color: Colors.white,
                  ),
                  height: double.infinity,
                )
              ),
              Container(
                height: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: Utils.defaultBorderRadius.toDouble(), vertical: Utils.defaultBorderRadius.toDouble() + 5),
                width: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  // Desc : Check if shimmer is on refresh, give 10 items; but if its on load only give 1 shimmer
                  children: List.generate(3, (index) {
                    return Column(
                      children: [
                        Container(
                          height: Utils.mediumFontSize.toDouble() * (index == 0 ? 2 : 1.3),
                          color: Colors.white,
                        ),
                        index == 2 ? SizedBox.shrink() : SizedBox(height: 5)
                      ],
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}