import 'package:flutter/cupertino.dart';

class ShowPasswdProvider extends ChangeNotifier {
  bool isNotShow = true;
  void showPassword() {
    isNotShow = !isNotShow;
    notifyListeners();
  }
}
