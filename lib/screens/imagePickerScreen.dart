import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:null_pointers/handlers/imagePickerHandler.dart';
import 'package:null_pointers/screens/ResultXrayScreen.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class Imagepickerscreen extends StatefulWidget {
  const Imagepickerscreen({super.key});

  @override
  State<Imagepickerscreen> createState() => _ImagepickerscreenState();
}

ImagePickerHandler imagePickerHandler = ImagePickerHandler();

class _ImagepickerscreenState extends State<Imagepickerscreen> {
  XFile? image = null;
  bool isPhotoUploaded = false;
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
                      onPressed: () async {
                        isPhotoUploaded =
                            await imagePickerHandler.uploadPhoto();
                        setState(() {});
                        if (isPhotoUploaded) {
                          const snackbar = SnackBar(
                            content: Text(
                                "Image uploaded successfully, ready to process"),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackbar);
                        } else {
                          const snackbar = SnackBar(
                            content:
                                Text("Image not uploaded, please try again"),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackbar);
                        }
                      },
                      child: Text("Upload image to backend")),
                ),
              if (isPhotoUploaded)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () async {
                        var response = await imagePickerHandler.processImage();
                        // logger.w(response);
                        if (response.containsKey("result")) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Resultxrayscreen(
                                  mpp: response,
                                ),
                              ));
                        }
                      },
                      child: Text("Process Image")),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
