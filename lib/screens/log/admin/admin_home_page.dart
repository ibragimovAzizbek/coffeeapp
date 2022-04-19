import 'package:coffeeapp/core/constants/color_const.dart';
import 'package:coffeeapp/core/constants/font_const.dart';
import 'package:coffeeapp/providers/coffee_upload_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:provider/provider.dart';

class AdminHomePage extends StatelessWidget {
  AdminHomePage({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  XFile? image;
  final _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: Colors.transparent,
            elevation: 0,
            context: context,
            builder: (context) => StatefulBuilder(
              builder: ((context, setState) => Container(
                    margin: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: ColorConst.kSccaffoldColor,
                      borderRadius: BorderRadius.circular(
                        FontConst.kMediumFont,
                      ),
                    ),
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: Column(
                      children: [
                        const Text('Add new coffe image',
                            style: TextStyle(fontSize: 20)),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.04),
                          child: TextFormField(
                            controller: nameController,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                              hintText: "Enter new coffee name",
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.04),
                          child: TextFormField(
                            controller: priceController,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                              hintText: "Enter new coffee price",
                            ),
                          ),
                        ),
                        ElevatedButton(
                          child: const Text('Upload image coffee'),
                          onPressed: () async {
                            image = await _picker.pickImage(
                              source: ImageSource.gallery,
                            );

                            setState(() {});
                          },
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: image != null
                              ? Image.file(File(image!.path))
                              : const Text("Image not uploaded yet !"),
                        ),
                        ElevatedButton(
                          child: const Text('Add a coffee to shop'),
                          onPressed: () async {
                            context
                                .read<CoffeeUploadProvider>()
                                .coffeeUploadTODb(
                                  context,
                                  nameController.text,
                                  priceController.text,
                                );
                            context
                                .read<CoffeeUploadProvider>()
                                .uploadImageToStorage(
                                  image!,
                                  nameController.text,
                                );
                          },
                        ),
                      ],
                    ),
                  )),
            ),
          );
        },
      ),
    );
  }
}
