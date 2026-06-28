import 'package:cook_app/app/data/image_network.dart';
import 'package:cook_app/app/data/review_tile.dart';
import 'package:cook_app/app/data/utils.dart';
import 'package:cook_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliver_snap/sliver_snap.dart';
import '../controllers/recipe_controller.dart';

class RecipeView extends GetView<RecipeController> {
  const RecipeView({super.key});
  @override
  Widget build(BuildContext context) {
    var availableHeight = MediaQuery.of(context).size.height -
        AppBar().preferredSize.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom -
        70;

    return Scaffold(
      backgroundColor: Utils.mainBgColor,
      body: SafeArea(
        child: Stack(
          children: [
            Obx(
              () => SliverSnap(
                backdropWidget: CustomImageNetwork.build(
                    "https://images.getrecipekit.com/20230426094845-miso-20chashu-20ramen.jpg?aspect_ratio=4:3&quality=90&",
                    equalSize: true),
                // Desc : Shown recipe's name when scroll on top
                expandedBackgroundColor: Colors.transparent,
                expandedContent: Container(
                  padding: EdgeInsets.all(Utils.defaultBorderRadius.toDouble()),
                  alignment: Alignment.bottomLeft,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [
                        0,
                        0.7,
                        0.9
                      ],
                          colors: [
                        Colors.transparent,
                        Colors.transparent,
                        Utils.appBarBgColor
                      ])),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.recipe.value.title,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: Utils.mediumFontSize.toDouble(),
                            fontWeight: FontWeight.bold,
                            color: Utils.mainTextColor),
                      ),
                      tabView(
                          // Desc : If tab "Description" is pressed
                          () {
                        controller.pageController.animateToPage(0,
                            duration: Utils.textPopUpDuration,
                            curve: Utils.textCurves);
                      },
                          // Desc : If tab "Review" is pressed
                          () {
                        controller.pageController.animateToPage(1,
                            duration: Utils.textPopUpDuration,
                            curve: Utils.textCurves);
                      }),
                    ],
                  ),
                ),

                // Desc : Shown tab bar when scroll on bottom
                collapsedBackgroundColor: Utils.appBarBgColor,
                collapsedBarHeight: 70,
                collapsedContent: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(height: Utils.defaultAppMargin.toDouble()),
                    Text(
                      controller.recipe.value.title,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: Utils.mediumFontSize.toDouble(),
                          fontWeight: FontWeight.bold,
                          color: Utils.mainTextColor),
                    ),
                    tabView(
                        // Desc : If tab "Description" is pressed
                        () {
                      controller.pageController.animateToPage(0,
                          duration: Utils.textPopUpDuration,
                          curve: Utils.textCurves);
                    },
                        // Desc : If tab "Review" is pressed
                        () {
                      controller.pageController.animateToPage(1,
                          duration: Utils.textPopUpDuration,
                          curve: Utils.textCurves);
                    }),
                  ],
                ),

                // Desc : Called when change scroll on / to top or bottom
                onCollapseStateChanged:
                    (isCollapsed, scrollingOffset, maxExtent) {
                  controller.onCollapse.value = isCollapsed;
                },

                // Desc : Content below
                body: Container(
                  height: availableHeight,
                  decoration: BoxDecoration(
                    color: Utils.appBarBgColor,
                  ),
                  child: PageView(
                    controller: controller.pageController,
                    onPageChanged: (index) {
                      controller.currentPage.value = index;
                    },
                    children: [descriptionView(), reviewView()],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => Get.toNamed(Routes.TUTORIAL),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Utils.mainColor,
                        borderRadius: BorderRadius.all(Radius.circular(
                            Utils.defaultBorderRadius.toDouble())),
                        border: Border.all(
                            width: Utils.defaultBorderRadius.toDouble() / 4,
                            color: Utils.mainLightColor)),
                    margin: EdgeInsets.only(
                        bottom: Utils.defaultAppMargin.toDouble()),
                    padding:
                        EdgeInsets.all(Utils.defaultAppMargin.toDouble() / 2),
                    child: Text(
                      "Cook Now",
                      style: TextStyle(
                          color: Utils.altTextColor,
                          fontSize: Utils.mainFontSize.toDouble(),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Desc : Tab bar for description and rating
  Widget tabView(Function tapDescription, Function tapReview) {
    return Container(
      padding:
          EdgeInsets.symmetric(vertical: Utils.defaultBorderRadius.toDouble()),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Desc : Description
          Obx(
            () => Expanded(
              child: GestureDetector(
                onTap: () => tapDescription(),
                child: Center(
                  child: Text(
                    "Description",
                    style: TextStyle(
                        color: Utils.mainTextColor,
                        fontSize: Utils.mainFontSize.toDouble(),
                        decoration: controller.currentPage.value == 0
                            ? TextDecoration.underline
                            : null),
                  ),
                ),
              ),
            ),
          ),

          // Desc : Space
          Text("|",
              style: TextStyle(
                  color: Utils.mainTextColor,
                  fontSize: Utils.mainFontSize.toDouble())),

          // Desc : Review
          Obx(
            () => Expanded(
              child: GestureDetector(
                onTap: () => tapReview(),
                child: Center(
                  child: Text(
                    "Review",
                    style: TextStyle(
                        color: Utils.mainTextColor,
                        fontSize: Utils.mainFontSize.toDouble(),
                        decoration: controller.currentPage.value == 1
                            ? TextDecoration.underline
                            : null),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Desc : Recipe's content
  Widget descriptionView() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(Utils.defaultBorderRadius.toDouble()),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Desc : Description
            Container(
              margin: EdgeInsets.symmetric(vertical: 6),
              padding: EdgeInsets.all(Utils.defaultBorderRadius.toDouble()),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                      Radius.circular(Utils.defaultBorderRadius.toDouble())),
                  border: Border.all(
                      color: Utils.mainColor,
                      width: 1,
                      style: BorderStyle.solid)),
              child: Text(
                '"${controller.recipe.value.description}"',
                style: TextStyle(
                    fontSize: Utils.mainFontSize.toDouble(),
                    color: Utils.mainTextColor),
              ),
            ),

            // Desc : Serving & Preparation Time
            Container(
              margin: EdgeInsets.symmetric(vertical: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person,
                          color: Utils.mainTextColor,
                          size: Utils.mainFontSize.toDouble(),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: Utils.defaultBorderRadius.toDouble()),
                          child: Text(
                            "${controller.recipe.value.serving.toString()} person(s)",
                            style: TextStyle(
                              fontSize: Utils.mainFontSize.toDouble(),
                              color: Utils.mainTextColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.timer_sharp,
                          color: Utils.mainTextColor,
                          size: Utils.mainFontSize.toDouble(),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: Utils.defaultBorderRadius.toDouble()),
                          child: Text(
                            controller.recipe.value.preparation,
                            style: TextStyle(
                                fontSize: Utils.mainFontSize.toDouble(),
                                color: Utils.mainTextColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Desc : Ingredients
            Container(
              margin: EdgeInsets.symmetric(vertical: 6),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Ingredients",
                    style: TextStyle(
                        fontSize: Utils.mediumFontSize.toDouble(),
                        fontWeight: FontWeight.bold,
                        color: Utils.mainTextColor),
                  ),
                  Text(
                    controller.recipe.value.ingredients,
                    style: TextStyle(
                        fontSize: Utils.mainFontSize.toDouble(),
                        color: Utils.mainTextColor),
                  ),
                ],
              ),
            ),

            // Desc : Guide
            Container(
              margin: EdgeInsets.symmetric(vertical: 6),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Guide",
                    style: TextStyle(
                        fontSize: Utils.mediumFontSize.toDouble(),
                        fontWeight: FontWeight.bold,
                        color: Utils.mainTextColor),
                  ),
                  Text(
                    controller.recipe.value.guide,
                    style: TextStyle(
                        fontSize: Utils.mainFontSize.toDouble(),
                        color: Utils.mainTextColor),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Desc : Recipe's review
  Widget reviewView() {
    return RefreshIndicator(
      onRefresh: () async {},
      child: CustomScrollView(
        controller: controller.reviewScrollController,
        slivers: [
          Obx(() {
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  // Desc : Show shimmer effect when loading
                  if (index == controller.reviews.length) {
                    return controller.loading.value
                        // Desc : Check if shimmer is on refresh, give 10 items; but if its on load only give 1 shimmer
                        ? Column(
                            children: List.generate(
                                controller.reviewIsRefreshing.value ? 10 : 1,
                                (index) {
                              return ReviewTile.shimmer();
                            }),
                          )
                        : SizedBox();
                  }

                  // Desc : Call the build function of the tile item and check selection state
                  return ReviewTile.build(controller.reviews[index]);
                },
                childCount: controller.reviews.length +
                    1, // Add 1 for loading indicator
              ),
            );
          }),
        ],
      ),
    );
  }
}
