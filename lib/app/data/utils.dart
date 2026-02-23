import 'package:flutter/material.dart';

class Utils {
  // Desc : App Color
  static var mainColor = const Color(0xFF52CEC8);
  static var mainLightColor = const Color(0xFF6FE9E3);
  static var mainBgColor = const Color(0xFF1F1F1F);
  static var appBarBgColor = const Color(0xFF2F2F2F);
  static var drawerCurrentColor = const Color(0x20196F6B);  
  static var mainHoverBgColor = const Color(0x99196F6B);  
  static var loadingBgColor = const Color(0x20000000);  
  static var ratingColor = const Color(0xFFFFCE47);  

  // Desc : Font Color
  static var mainTextColor = Colors.white;
  static var blackTextColor = Colors.black;
  static var altTextColor = const Color(0xFF196F6B);  
  static var imageErrorTextColor = const Color(0xFFFFFFFF);  

  // Desc : Container Size
  static var defaultBorderRadius = 10;
  static var defaultAppMargin = 20;

  // Desc : Font Size
  static var bigFontSize = 20;
  static var mediumFontSize = 17;
  static var mainFontSize = 14;
  static var smallFontSize = 12;
  static var appBarFontSize = 20;

  // Desc : Animation
  static var textPopUpDuration = Duration(milliseconds: 400);
  static var textCurves = Curves.fastEaseInToSlowEaseOut;
  static var pageRouteCurves = Curves.fastEaseInToSlowEaseOut;
}