import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffeeapp/core/widgets/show_my_snackbar.dart';
import 'package:coffeeapp/services/firebase/fire_service.dart';
import 'package:coffeeapp/services/location/get_location.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_geocoder/geocoder.dart';

class RegsterProvider extends ChangeNotifier {
  void regsterUser(String email, String password, BuildContext context,
      GlobalKey<FormState> globalKey) async {
    try {
      if (globalKey.currentState!.validate()) {
        UserCredential userCredential = await FireService.auth
            .createUserWithEmailAndPassword(email: email, password: password);
        var location = await GetLocation.determinePosition();
        var address = await Geocoder.local.findAddressesFromCoordinates(
            Coordinates(location.latitude, location.longitude));
        await FireService.firestore.collection('users').doc(email).set({
          "email": email,
          "create_at": FieldValue.serverTimestamp(),
          "location": address[0].addressLine,
          "orders": [],
          "history_orders": [],
        });
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        MyShowSnackBar.myShowSnackBar(
            context, 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        MyShowSnackBar.myShowSnackBar(
            context, 'The account already exists for that email.');
      }
      
    } catch (e) {
      MyShowSnackBar.myShowSnackBar(context, 'Something went wrong');
    }
  }
}
