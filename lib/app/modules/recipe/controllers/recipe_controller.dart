import 'package:cook_app/app/data/recipe_data.dart';
import 'package:cook_app/app/data/recipe_tile_data.dart';
import 'package:cook_app/app/data/review_tile_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecipeController extends GetxController {
  var recipe = RecipeData().obs;
  var loading = true.obs;
  var onCollapse = true.obs;
  var reviewIsRefreshing = true.obs;
  var reviewScrollController = ScrollController();
  var reviews = [].obs;
  var pageController = PageController();
  var currentPage = 0.obs;


  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    var recipeId = (Get.arguments as RecipeTileData).id;
    getRecipeData(recipeId);
    reviews.value.addAll([
      ReviewTileData(
        id: "0", 
        user: "Test", 
        userImage: "https://png.pngtree.com/element_our/png/20181206/users-vector-icon-png_260862.jpg", 
        rating: 4, 
        review: "Good",
        date: "24 Sept 2024, 14.35"
      ),
      ReviewTileData(
        id: "1", 
        user: "Beta", 
        userImage: "https://png.pngtree.com/element_our/png/20181206/users-vector-icon-png_260862.jpg", 
        rating: 5, 
        review: "Good",
        date: "24 Okt 2024, 14.35"
      ),
    ]);

  }

  @override
  void onClose() {
    super.onClose();
  }

  void getRecipeData(String id) {
    loading.value = true;
    recipe.value = RecipeData.fromJson({
      "id": "0",
      "image": "https://images.getrecipekit.com/20230426094845-miso-20chashu-20ramen.jpg?aspect_ratio=4:3&quality=90&",
      "title": "Miso Ramen with Chashu",
      "like": false,
      "rating": 4.5,
      "serving": 1,
      "preparation": "2.5 hours",
      "description": "A Japanese-style ramen that used Miso as its based and Chasu as toppings, dressed with fresh spring onions. Perfectly balanced between light-yet-bold soup and the smokey taste of Chasu that has been soaked with mirin to make a simple ramen become so rich with flavour.",
      "user": "User Tetsu",
      "userImage": "",
      "ingredients": "1 stalk of spring onion\n300 grams of pork belly\n3 cloves of garlic\n1 piece of ginger\n1/2 teaspoon of baking soda\n1 tablespoon of salt\n1 tablespoon of miso\n100 grams of ramen noodles\n1 sheet of seaweed\nsalt to taste\noil to taste",
      "guide": "1. test\n2. test\n3. test\n4. test\n5. test\n6. test\n7. test\n8. test\n9. test"
    });
    loading.value = false;
  }

}
