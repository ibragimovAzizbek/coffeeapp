import 'package:coffeeapp/core/constants/color_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InputIconOnWidget extends StatelessWidget {
  String text;
  String path;
  InputIconOnWidget({Key? key, required this.text, required this.path})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.03),
      child: Row(
        children: [
          SvgPicture.asset(path),
          SizedBox(width: MediaQuery.of(context).size.width * 0.02),
          Text(
            text,
            style: TextStyle(
                color: ColorConst.kGreyText,
                fontSize: MediaQuery.of(context).size.width * 0.045),
          ),
        ],
      ),
    );
  }
}
