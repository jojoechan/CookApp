import 'package:cook_app/app/data/home_drawer.dart';
import 'package:cook_app/app/data/loading_view.dart';
import 'package:cook_app/app/data/recipe_tile.dart';
import 'package:cook_app/app/data/recipe_tile_data.dart';
import 'package:cook_app/app/data/utils.dart';
import 'package:cook_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Utils.mainColor,
        backgroundColor: Utils.appBarBgColor,
        title: Stack(
          children: [
            // Center(child: Text('Home', style: TextStyle(color: Utils.mainTextColor, fontFamily: 'Heavitas'))),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "C",
                    style: TextStyle(
                        fontSize: Utils.appBarFontSize.toDouble() * 2,
                        fontFamily: 'Heavitas',
                        fontWeight: FontWeight.bold,
                        color: Utils.mainColor),
                  ),
                  Text(
                    "ook APP",
                    style: TextStyle(
                        fontSize: Utils.appBarFontSize.toDouble(),
                        fontFamily: 'Heavitas',
                        fontWeight: FontWeight.bold,
                        color: Utils.mainColor),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Utils.mainColor, width: 2)),
                  child: Icon(Icons.search_outlined, color: Utils.mainColor)),
            )
          ],
        ),
      ),
      // drawer: HomeDrawer.build(),
      backgroundColor: Utils.mainBgColor,
      body: SafeArea(
        child: Obx(
          () => LoadingView.build(
            isLoading: controller.isLoadingAll.value,
            isShowContentOnLoading: false,
            child: Stack(
              children: [
                // Desc : Home Page
                RefreshIndicator(
                  onRefresh: () async {
                    controller.exploreRefreshItems();
                  },
                  child: CustomScrollView(
                    controller: controller.scrollController,
                    slivers: [
                      // Desc : Header above Explore recipes
                      SliverToBoxAdapter(
                        child: Container(
                          padding: EdgeInsets.all(16),
                          // color: Colors.grey[200],
                          child: Text(
                            'Explore',
                            style: TextStyle(
                                fontSize: 20,
                                color: Utils.mainTextColor,
                                fontFamily: "Heavitas"),
                          ),
                        ),
                      ),

                      // Desc : Explore recipes
                      Obx(() {
                        return SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              // Desc : Show shimmer effect when loading
                              if (index == controller.exploreItems.length) {
                                return controller.isLoading.value
                                    // Desc : Check if shimmer is on refresh, give 10 items; but if its on load only give 1 shimmer
                                    ? Column(
                                        children: List.generate(
                                            controller.exploreIsRefreshing.value
                                                ? 10
                                                : 1, (index) {
                                          return RecipeTile.shimmer();
                                        }),
                                      )
                                    : SizedBox();
                              }

                              // Desc : Call the build function of the tile item and check selection state
                              // bool isSelected = controller.exploreSelectedIndex.value == index;
                              return RecipeTile.build(
                                  controller.exploreItems[index],
                                  (controller.exploreItems[index]
                                          as RecipeTileData)
                                      .isChoosed, () {
                                bool openRecipe = !(controller
                                        .exploreItems[index] as RecipeTileData)
                                    .isChoosed;
                                (controller.exploreItems[index]
                                        as RecipeTileData)
                                    .isChoosed = false;
                                (controller.exploreItems[
                                        controller.exploreSelectedIndex.value ??
                                            0] as RecipeTileData)
                                    .isChoosed = false;
                                controller.exploreSelectedIndex.value = null;
                                controller.exploreItems.refresh();
                                if (openRecipe) {
                                  Get.toNamed(Routes.RECIPE,
                                      arguments:
                                          controller.exploreItems[index]);
                                }
                              }, () {
                                if (!(controller.exploreItems[index]
                                        as RecipeTileData)
                                    .isChoosed) {
                                  (controller.exploreItems[controller
                                              .exploreSelectedIndex.value ??
                                          0] as RecipeTileData)
                                      .isChoosed = false;
                                  if (controller.exploreSelectedIndex.value !=
                                      index) {
                                    (controller.exploreItems[index]
                                            as RecipeTileData)
                                        .isChoosed = true;
                                    controller.exploreSelectedIndex.value =
                                        index;
                                  } else {
                                    controller.exploreSelectedIndex.value =
                                        null;
                                  }
                                } else {
                                  (controller.exploreItems[controller
                                              .exploreSelectedIndex.value ??
                                          0] as RecipeTileData)
                                      .isChoosed = false;
                                  controller.exploreSelectedIndex.value = null;
                                }
                                controller.exploreItems.refresh();
                              });
                            },
                            childCount: controller.exploreItems.length +
                                1, // Add 1 for loading indicator
                          ),
                        );
                      }),
                    ],
                  ),
                ),

                // Desc : Bottom Navigation
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.transparent, Utils.mainBgColor],
                            stops: [0, 0.5])),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        navigationItem(
                            Icon(Icons.directions_walk_outlined,
                                color: Utils.mainColor),
                            false),
                        navigationItem(
                            Icon(Icons.location_on_outlined,
                                color: Utils.mainColor),
                            false),
                        navigationItem(
                            Icon(Icons.home, color: Utils.mainColor), true),
                        navigationItem(
                            Icon(Icons.import_contacts_rounded,
                                color: Utils.mainColor),
                            false),
                        navigationItem(
                            Icon(Icons.settings, color: Utils.mainColor),
                            false),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget navigationItem(Icon icon, bool isSelected) {
    return Expanded(
      child: Container(
          padding: EdgeInsets.all(13),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              icon,
              Container(
                margin: EdgeInsets.only(top: 3),
                height: 2,
                color: isSelected ? Utils.mainColor : Colors.transparent,
              )
            ],
          )),
    );
  }
}
