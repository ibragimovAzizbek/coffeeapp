import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffeeapp/services/firebase/fire_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CoffeeUploadProvider extends ChangeNotifier {
  Future coffeeUploadTODb(
      BuildContext context, String name, String price) async {
    CollectionReference coffees = FireService.firestore.collection('coffee');
    await coffees.doc(name).set(
      {
        "name": name,
        "price": price,
        "image_url": "",
        "create_at": FieldValue.serverTimestamp(),
      },
    );
    Navigator.pop(context);
  }

  Future uploadImageToStorage(XFile file, name) async {
    var image = await FireService.storage
        .ref()
        .child('coffee')
        .child('images')
        .child(name)
        .putFile(File(file.path));
    String downloadUrl = await image.ref.getDownloadURL();
    await FireService.firestore.collection('coffee').doc(name).set(
      {"image_url": downloadUrl},
      SetOptions(merge: true),
    ).onError((error, stackTrace) {
      debugPrint("Error Storage image upload $error");
    });
  }
}
