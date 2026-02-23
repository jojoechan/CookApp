import 'package:cook_app/app/data/image_network.dart';
import 'package:cook_app/app/data/review_tile_data.dart';
import 'package:cook_app/app/data/utils.dart';
import 'package:cook_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class ReviewTile {

  static Widget build(ReviewTileData review){
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Reviewer's Image
          Container(
            width: 80,
            height: 80,
            margin: EdgeInsets.only(right: Utils.defaultAppMargin.toDouble()),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(Utils.defaultBorderRadius.toDouble()),
              )
            ),
            child: CustomImageNetwork.build(
              review.userImage, 
              equalSize: false,
              customBorderRadius: BorderRadius.all(
                Radius.circular(Utils.defaultBorderRadius.toDouble()),
              ),
              fontSize: Utils.smallFontSize.toDouble()
            ),
          ),
      
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Reviewer's Name
                          Text(review.user, style: TextStyle(color: Utils.mainTextColor)),
                            
                          // Review's Date
                          Text(review.date, style: TextStyle(color: Utils.mainTextColor)),
                        ],
                      ),
                    ),
      
                    //Rating
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(Icons.star_rate_rounded, size: 30, color: Utils.ratingColor),
                        Container(
                          margin: EdgeInsets.only(bottom: 0),
                          child: Text(review.rating.toString(), style: TextStyle(
                            color: Utils.mainTextColor)
                          )
                        ) 
                      ],
                    ),
                  ],
                ),
                // Review
                Text(review.review, style: TextStyle(color: Utils.mainTextColor))
              ],
            ),
          ),
        ],
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
        alignment: Alignment.centerRight,
        child: Shimmer.fromColors(
          baseColor: Colors.grey[800]!,
          highlightColor: Colors.grey[700]!,
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(Utils.defaultBorderRadius.toDouble()),
                      )
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Reviewer's Name
                        SizedBox(
                          width: double.infinity,
                          height: Utils.bigFontSize.toDouble(),
                        ),

                        SizedBox(
                          width: double.infinity,
                          height: Utils.bigFontSize.toDouble(),
                        ),
                      ],
                    ),
                  ),

                  //Rating
                  SizedBox(
                    width: Utils.bigFontSize.toDouble() * 3,
                    height: Utils.bigFontSize.toDouble(),
                  ),
                ],
              ),
          
              // Review
              SizedBox(
                width: double.infinity,
                height: Utils.mainFontSize.toDouble() * 4,
              ),
            ],
          ),
        
        ),
      ),
    );
  }
}