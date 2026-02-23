import 'package:cook_app/app/data/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../modules/country/bindings/country_binding.dart';
import '../modules/country/views/country_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/likes/bindings/likes_binding.dart';
import '../modules/likes/views/likes_view.dart';
import '../modules/my_recipes/bindings/my_recipes_binding.dart';
import '../modules/my_recipes/views/my_recipes_view.dart';
import '../modules/recipe/bindings/recipe_binding.dart';
import '../modules/recipe/views/recipe_view.dart';
import '../modules/recipes_list/bindings/recipes_list_binding.dart';
import '../modules/recipes_list/views/recipes_list_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/tutorial/bindings/tutorial_binding.dart';
import '../modules/tutorial/views/tutorial_view.dart';
import '../modules/video/bindings/video_binding.dart';
import '../modules/video/views/video_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
        name: _Paths.HOME,
        page: () => const HomeView(),
        binding: HomeBinding(),
        transition: Transition.rightToLeftWithFade),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.COUNTRY,
      page: () => const CountryView(),
      binding: CountryBinding(),
    ),
    GetPage(
      name: _Paths.RECIPES_LIST,
      page: () => const RecipesListView(),
      binding: RecipesListBinding(),
    ),
    GetPage(
      name: _Paths.RECIPE,
      page: () => const RecipeView(),
      binding: RecipeBinding(),
      transition: Transition.rightToLeft,
      curve: Utils.pageRouteCurves
    ),
    GetPage(
      name: _Paths.VIDEO,
      page: () => const VideoView(),
      binding: VideoBinding(),
    ),
    GetPage(
      name: _Paths.TUTORIAL,
      page: () => const TutorialView(),
      binding: TutorialBinding(),
    ),
    GetPage(
      name: _Paths.LIKES,
      page: () => const LikesView(),
      binding: LikesBinding(),
    ),
    GetPage(
      name: _Paths.MY_RECIPES,
      page: () => const MyRecipesView(),
      binding: MyRecipesBinding(),
    ),
  ];
}
