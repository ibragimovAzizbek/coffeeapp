import 'package:coffeeapp/core/widgets/show_my_snackbar.dart';
import 'package:coffeeapp/services/firebase/fire_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class LoginProvider extends ChangeNotifier {
  Future loginProvider(BuildContext context, String email, String password,
      GlobalKey<FormState> globalKey) async {
    try {
      if (globalKey.currentState!.validate()) {
        UserCredential userCredential = await FireService.auth
            .signInWithEmailAndPassword(email: email, password: password);
        if (email == 'admin@gmail.com' && password == '332211') {
          Navigator.pushNamedAndRemoveUntil(
              context, '/admin', (route) => false);
        } else {
          Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
        }
      } else {
        MyShowSnackBar.myShowSnackBar(context, 'Fill all fields');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        MyShowSnackBar.myShowSnackBar(context, 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        MyShowSnackBar.myShowSnackBar(
            context, 'Wrong password provided for that user.');
      }
    }
  }

  Future logOut(BuildContext context) async {
    await FireService.auth.signOut();
    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  }
}
