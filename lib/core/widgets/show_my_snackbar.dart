import 'package:coffeeapp/core/constants/color_const.dart';
import 'package:flutter/material.dart';

class MyShowSnackBar {
  static myShowSnackBar(BuildContext context, String text,
          [Color color = ColorConst.red]) =>
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(text),
        backgroundColor: color,
      ));
}
