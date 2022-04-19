import 'package:coffeeapp/core/constants/color_const.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  BuildContext context;
  String title;
  Color? color;
  final VoidCallback? funtion;
  final IconData? icon;
  MyAppBar({
    Key? key,
    required this.context,
    required this.title,
    this.color = ColorConst.kPrimaryColor,
    this.funtion,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      title: Text(title),
      backgroundColor: ColorConst.kPrimaryColor,
      actions: [
        funtion != null
            ? IconButton(
                icon: Icon(icon != null ? icon : Icons.logout),
                onPressed: funtion,
              )
            : const SizedBox()
      ],
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(MediaQuery.of(context).size.height * 0.08);
}
