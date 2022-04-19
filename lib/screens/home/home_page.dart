import 'package:coffeeapp/core/widgets/my_appbar.dart';
import 'package:coffeeapp/providers/regsterAndLogin/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        context: context,
        title: 'Coffee Shopping',
        funtion: () {
          context.read<LoginProvider>().logOut(context);
        },
      ),
    );
  }
}
