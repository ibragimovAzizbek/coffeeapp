import 'package:coffeeapp/core/components/theme_comp.dart';
import 'package:coffeeapp/providers/coffee_upload_provider.dart';
import 'package:coffeeapp/providers/regsterAndLogin/login_provider.dart';
import 'package:coffeeapp/providers/regsterAndLogin/regster_provider.dart';
import 'package:coffeeapp/providers/route_provider.dart';
import 'package:coffeeapp/providers/show_password_provider.dart';
import 'package:coffeeapp/routes/my_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => ShowPasswdProvider())),
        ChangeNotifierProvider(create: ((context) => LoginProvider())),
        ChangeNotifierProvider(create: ((context) => RegsterProvider())),
        ChangeNotifierProvider(create: ((context) => RouteProvider())),
        ChangeNotifierProvider(create: ((context) => CoffeeUploadProvider())),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final MyRoute _myRoute = MyRoute();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coffee shopping',
      theme: ThemeComp.myTheme,
      initialRoute: context.watch<RouteProvider>().route,
      onGenerateRoute: _myRoute.onGenerateRoute,
    );
  }
}
