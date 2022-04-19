import 'package:coffeeapp/core/constants/color_const.dart';
import 'package:flutter/material.dart';

class ThemeComp {
  static ThemeData get myTheme => ThemeData(
        colorScheme: ColorScheme.light(primary: ColorConst.kPrimaryColor),
        scaffoldBackgroundColor: ColorConst.kSccaffoldColor
      );
}
