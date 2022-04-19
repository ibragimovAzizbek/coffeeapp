import 'package:coffeeapp/core/constants/color_const.dart';
import 'package:coffeeapp/core/constants/font_const.dart';
import 'package:coffeeapp/providers/regsterAndLogin/login_provider.dart';
import 'package:coffeeapp/providers/regsterAndLogin/regster_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyElevetedButton extends StatelessWidget {
  String buttonText;
  GlobalKey<FormState> keyGlobal;

  String email;
  String password;

  MyElevetedButton({
    Key? key,
    required this.buttonText,
    required this.keyGlobal,
    required this.email,
    required this.password,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        buttonText,
        style: TextStyle(fontSize: FontConst.kExtraLargeFont),
      ),
      style: ElevatedButton.styleFrom(
        fixedSize: Size(
          MediaQuery.of(context).size.width * 0.7,
          MediaQuery.of(context).size.height * 0.07,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            FontConst.kSmallFont,
          ),
        ),
        primary: ColorConst.elevetadButtonColor,
      ),
      onPressed: () {
        buttonText == 'Sign In'
            ? context
                .read<LoginProvider>()
                .loginProvider(context, email, password, keyGlobal)
            : context
                .read<RegsterProvider>()
                .regsterUser(email, password, context, keyGlobal);
      },
    );
  }
}
