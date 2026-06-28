import 'dart:async';

import 'package:cook_app/app/data/recipe_tile_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;
  var isLoadingAll = false.obs;

  // Desc : Scroll controller for entire view
  var scrollController = ScrollController();

  // Desc : Explore Recipes
  var exploreItems = [].obs;
  var exploreItemsMore = false.obs;
  var exploreIsRefreshing = false.obs;
  var exploreCurrentPage = 1.obs;
  var exploreSelectedIndex = Rx<int?>(null);

  // Desc : Trending Recipes
  var trendingItems = [].obs;
  var trendingItemsMore = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    isLoading.value = true;
    exploreRefreshItems();
    // Timer(const Duration(seconds: 2), () => exploreRefreshItems());
  }

  @override
  void onClose() {
    super.onClose();
  }

  // Desc : Load more items (simulate API call)
  void exploreLoadMoreItems() async {
    if (isLoading.value || !exploreItemsMore.value) return;
    isLoading.value = true;

    // Desc : Simulate API call
    Timer(const Duration(seconds: 2), () {
      var getList = [
        RecipeTileData(
            id: "0",
            image:
                "https://images.getrecipekit.com/20230426094845-miso-20chashu-20ramen.jpg?aspect_ratio=4:3&quality=90&",
            title: "Miso Ramen with Chashu",
            like: false,
            serving: 1,
            preparation: "2.5 hours"),
        RecipeTileData(
            id: "1",
            image:
                "https://images-gmi-pmc.edge-generalmills.com/1a03ff0f-658d-46b4-8f39-96a0a5327d4c.jpg",
            title: "Sausage Pizza with Cheese",
            like: false,
            serving: 6,
            preparation: "1.5 hours"),
        RecipeTileData(
            id: "2",
            image:
                "https://www.marthastewart.com/thmb/F5NlL1t5F-4enUkpzkuq9I6Kriw=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/martha-stewart-cooking-school-porchetta-am-1046-d110633-20130923_horiz-e971415d7977453b98192e5648b13b34.jpgitoks1tQUFBj",
            title: "Porchetta",
            like: true,
            serving: 7,
            preparation: "8 hours"),
        RecipeTileData(
            id: "3",
            image:
                "https://www.foodandwine.com/thmb/XdFd-DvTtouryLCjeCqwhfmmK-A=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/molten-chocolate-cake-FT-RECIPE0220-0a33d7d0ab0c45588f7bfe742d33a9bc.jpg",
            title: "Chocolate Lava Cake",
            like: true,
            serving: 3,
            preparation: "20 minutes"),
        RecipeTileData(
            id: "4",
            image:
                "https://cdn.idntimes.com/content-images/community/2023/01/img-20230124-230917-3294511fb686103264d0033b1a94eabb.jpg",
            title: "Spaghetti Napolitan",
            like: false,
            serving: 2,
            preparation: "40 minutes"),
        RecipeTileData(
            id: "5",
            image:
                "https://www.simplyrecipes.com/thmb/5JwdiUjcSPTxyuhmdqv8pM8kWs0=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/Garlic-Bread-METHOD-2-3-1c5f5cfa8bf6408c84c0596eea83f8e8.jpg",
            title: "Garlic Bread",
            like: false,
            serving: 4,
            preparation: "1 hour"),
        RecipeTileData(
            id: "6",
            image:
                "https://afm-6b83.kxcdn.com/wp-content/uploads/2023/11/Large-Image-Recipe-Resize.png",
            title: "Nachos with Guacamole and Salsa",
            like: false,
            serving: 4,
            preparation: "1 hour"),
        RecipeTileData(
            id: "7",
            image: "https://i.ytimg.com/vi/YGxhoOmeuOQ/maxresdefault.jpg",
            title: "Braised Pork Belly",
            like: true,
            serving: 4,
            preparation: "3 hours"),
        RecipeTileData(
            id: "8",
            image:
                "https://cdn0-production-images-kly.akamaized.net/6l8T8wIe_CLeAoArWTBYxwWlbl0=/1200x675/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/4298259/original/006440600_1674307917-shutterstock_1981489370.jpg",
            title: "Soft Cookies",
            like: false,
            serving: 3,
            preparation: "90 minutes"),
        RecipeTileData(
            id: "9",
            image:
                "https://godairyfree.org/wp-content/uploads/2020/11/pics-Lemon-Meringue-Pie-feature.jpg",
            title: "Lemon Meringue Pie",
            like: false,
            serving: 2,
            preparation: "1.5 hours"),
        RecipeTileData(
            id: "10",
            image:
                "https://glebekitchen.com/wp-content/uploads/2017/04/tonkotsuramenfront-480x270.jpg",
            title: "Tonkotsu Ramen",
            like: false,
            serving: 4,
            preparation: "12 hours"),
      ];

      // if (getList.length < 10) {
      if (exploreItems.length < 30) {
        exploreItemsMore.value = false; // No more items available
      }

      if (getList.isNotEmpty) {
        exploreItems.addAll(getList);
        exploreCurrentPage.value++;
      }

      isLoading.value = false;
    });
  }

  // Desc : Refresh the list
  void exploreRefreshItems() async {
    exploreIsRefreshing.value = true;
    isLoading.value = true;
    exploreCurrentPage.value = 1;
    exploreItems.clear();

    // Desc : Simulate API call
    Timer(const Duration(seconds: 2), () {
      var getList = [
        RecipeTileData(
            id: "0",
            image:
                "https://images.getrecipekit.com/20230426094845-miso-20chashu-20ramen.jpg?aspect_ratio=4:3&quality=90&",
            title: "Miso Ramen with Chashu",
            like: false,
            serving: 1,
            preparation: "2.5 hours"),
        RecipeTileData(
            id: "1",
            image:
                "https://images-gmi-pmc.edge-generalmills.com/1a03ff0f-658d-46b4-8f39-96a0a5327d4c.jpg",
            title: "Sausage Pizza with Cheese",
            like: false,
            serving: 6,
            preparation: "1.5 hours"),
        RecipeTileData(
            id: "2",
            image:
                "https://www.marthastewart.com/thmb/F5NlL1t5F-4enUkpzkuq9I6Kriw=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/martha-stewart-cooking-school-porchetta-am-1046-d110633-20130923_horiz-e971415d7977453b98192e5648b13b34.jpgitoks1tQUFBj",
            title: "Porchetta",
            like: true,
            serving: 7,
            preparation: "8 hours"),
        RecipeTileData(
            id: "3",
            image:
                "https://www.foodandwine.com/thmb/XdFd-DvTtouryLCjeCqwhfmmK-A=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/molten-chocolate-cake-FT-RECIPE0220-0a33d7d0ab0c45588f7bfe742d33a9bc.jpg",
            title: "Chocolate Lava Cake",
            like: true,
            serving: 3,
            preparation: "20 minutes"),
        RecipeTileData(
            id: "4",
            image:
                "https://cdn.idntimes.com/content-images/community/2023/01/img-20230124-230917-3294511fb686103264d0033b1a94eabb.jpg",
            title: "Spaghetti Napolitan",
            like: false,
            serving: 2,
            preparation: "40 minutes"),
        RecipeTileData(
            id: "5",
            image:
                "https://www.simplyrecipes.com/thmb/5JwdiUjcSPTxyuhmdqv8pM8kWs0=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/Garlic-Bread-METHOD-2-3-1c5f5cfa8bf6408c84c0596eea83f8e8.jpg",
            title: "Garlic Bread",
            like: false,
            serving: 4,
            preparation: "1 hour"),
        RecipeTileData(
            id: "6",
            image:
                "https://afm-6b83.kxcdn.com/wp-content/uploads/2023/11/Large-Image-Recipe-Resize.png",
            title: "Nachos with Guacamole and Salsa",
            like: false,
            serving: 4,
            preparation: "1 hour"),
        RecipeTileData(
            id: "7",
            image: "https://i.ytimg.com/vi/YGxhoOmeuOQ/maxresdefault.jpg",
            title: "Braised Pork Belly",
            like: true,
            serving: 4,
            preparation: "3 hours"),
        RecipeTileData(
            id: "8",
            image:
                "https://cdn0-production-images-kly.akamaized.net/6l8T8wIe_CLeAoArWTBYxwWlbl0=/1200x675/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/4298259/original/006440600_1674307917-shutterstock_1981489370.jpg",
            title: "Soft Cookies",
            like: false,
            serving: 3,
            preparation: "90 minutes"),
        RecipeTileData(
            id: "9",
            image:
                "https://godairyfree.org/wp-content/uploads/2020/11/pics-Lemon-Meringue-Pie-feature.jpg",
            title: "Lemon Meringue Pie",
            like: false,
            serving: 2,
            preparation: "1.5 hours"),
        RecipeTileData(
            id: "10",
            image:
                "https://glebekitchen.com/wp-content/uploads/2017/04/tonkotsuramenfront-480x270.jpg",
            title: "Tonkotsu Ramen",
            like: false,
            serving: 4,
            preparation: "12 hours"),
      ];

      exploreItems.addAll(getList);
      exploreItemsMore.value =
          getList.length == 10; // Check if more items are available

      exploreIsRefreshing.value = false;
      isLoading.value = false;
    });
  }
}
