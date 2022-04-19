import 'package:coffeeapp/services/firebase/fire_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class RouteProvider extends ChangeNotifier {
  RouteProvider() {
    checkLoginPage();
  }
  String route = '/login';
  checkLoginPage() {
    if (FireService.auth.currentUser != null) {
      if (FireService.auth.currentUser!.email == 'admin@gmail.com') {
        FireService.auth.currentUser != null ? route = '/admin' : '/login';
      } else {
        FireService.auth.currentUser != null ? route = '/home' : '/login';
      }
    }
  }
}
