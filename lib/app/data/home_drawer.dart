import 'package:cook_app/app/data/image_network.dart';
import 'package:cook_app/app/data/utils.dart';
import 'package:cook_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeDrawer{
  static Widget build() {
    return Drawer(
      backgroundColor: Utils.mainBgColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Utils.mainColor,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: CustomImageNetwork.build(
                      "https://images3.alphacoders.com/135/1350069.jpeg",
                      equalSize: true,
                      withBorderRadius: true
                    )
                  ),
                ),
                // Text('Menu', style: TextStyle(color: Utils.altTextColor, fontFamily: 'Heavitas')),
              ],
            ),
          ),
          ListTile(
            title: Text('Home', style: TextStyle(color: Utils.mainTextColor)),
            hoverColor: Get.currentRoute == Routes.HOME ? null : Utils.mainHoverBgColor,
            tileColor: Get.currentRoute == Routes.HOME ? Utils.drawerCurrentColor : null,
            onTap: () {
              Get.currentRoute == Routes.HOME ? null : Get.offNamed(Routes.HOME);
            },
          ),
          ListTile(
            title: Text('Likes', style: TextStyle(color: Utils.mainTextColor)),
            hoverColor: Get.currentRoute == Routes.LIKES ? null : Utils.mainHoverBgColor,
            tileColor: Get.currentRoute == Routes.LIKES ? Utils.drawerCurrentColor : null,
            onTap: () {
              Get.currentRoute == Routes.LIKES ? null : Get.offNamed(Routes.LIKES);
            },
          ),
          ListTile(
            title: Text('My Recipes', style: TextStyle(color: Utils.mainTextColor)),
            hoverColor: Get.currentRoute == Routes.MY_RECIPES ? null : Utils.mainHoverBgColor,
            tileColor: Get.currentRoute == Routes.MY_RECIPES ? Utils.drawerCurrentColor : null,
            onTap: () {
              Get.currentRoute == Routes.MY_RECIPES ? null : Get.offNamed(Routes.MY_RECIPES);
            },
          ),
          ListTile(
            title: Text('Log Out', style: TextStyle(color: Utils.mainTextColor)),
            hoverColor: Utils.mainHoverBgColor,
            onTap: () {
              Get.currentRoute == Routes.MY_RECIPES ? null : Get.offNamed(Routes.MY_RECIPES);
            },
          ),
        ],
      ),
    );
  }
}