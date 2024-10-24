import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:null_pointers/handlers/imagePickerHandler.dart';

class Imagepickerscreen extends StatefulWidget {
  const Imagepickerscreen({super.key});

  @override
  State<Imagepickerscreen> createState() => _ImagepickerscreenState();
}

ImagePickerHandler imagePickerHandler = ImagePickerHandler();

class _ImagepickerscreenState extends State<Imagepickerscreen> {
  XFile? image = null;
  void pickImageHandler() async {
    final ImagePicker picker = ImagePicker();
    // Pick an image.
    image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) {
      const snackbar = SnackBar(
        content: Text("you have not selected any image please try again"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    } else {
      imagePickerHandler.image = image;
    }
    setState(() {});
    //TODO: add capturing photo feature
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pick an image"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 300,
                //TODO: add placeholder icon
                child: image == null
                    ? Container(
                        color: Colors.amber,
                      )
                    : Image.file(File(image!.path)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {
                      pickImageHandler();
                    },
                    child: Text("Pick Image")),
              ),
              if (image != null)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {
                        imagePickerHandler.uploadPhoto();
                      },
                      child: Text("Upload image to backend")),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
