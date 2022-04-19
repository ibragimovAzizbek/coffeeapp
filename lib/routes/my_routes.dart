import 'package:coffeeapp/screens/home/home_page.dart';
import 'package:coffeeapp/screens/log/admin/admin_page.dart';
import 'package:coffeeapp/screens/log/sign_in_page.dart';
import 'package:coffeeapp/screens/log/sign_up.dart';
import 'package:flutter/material.dart';

class MyRoute {
  Route? onGenerateRoute(RouteSettings settings) {
    var args = settings.arguments;

    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/login':
        return MaterialPageRoute(builder: (_) => SignIn());
      case '/signup':
        return MaterialPageRoute(builder: (_) => SignUp());

      case '/admin':
        return MaterialPageRoute(builder: (_) => AdminPage());
    }
  }
}
