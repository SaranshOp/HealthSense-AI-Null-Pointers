import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:null_pointers/handlers/imagePickerHandler.dart';
import 'package:null_pointers/handlers/imagePickerHandlerMRI.dart';
import 'package:null_pointers/screens/ResultMRIScreen.dart';
import 'package:null_pointers/screens/ResultXrayScreen.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class ImagepickerscreenMRI extends StatefulWidget {
  const ImagepickerscreenMRI({super.key});

  @override
  State<ImagepickerscreenMRI> createState() => _ImagepickerscreenMRIState();
}

ImagePickerHandlerMRI imagePickerHandlerMRI = ImagePickerHandlerMRI();

class _ImagepickerscreenMRIState extends State<ImagepickerscreenMRI> {
  int currentStep = 0;
  XFile? image = null;
  bool isPhotoUploaded = false;
  bool startLoading = false;

  Future<bool> pickImageHandler() async {
    final ImagePicker picker = ImagePicker();
    // Pick an image.
    image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) {
      const snackbar = SnackBar(
        content: Text("you have not selected any image please try again"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      setState(() {});
      return false;
    } else {
      imagePickerHandlerMRI.image = image;
      setState(() {});
      return true;
    }
    //TODO: add capturing photo feature
  }

  Future<bool> uploadPhoto() async {
    isPhotoUploaded = await imagePickerHandlerMRI.uploadPhoto();
    if (isPhotoUploaded) {
      const snackbar = SnackBar(
        content: Text("Image uploaded successfully, ready to process"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      setState(() {});
      return true;
    } else {
      const snackbar = SnackBar(
        content: Text("Image not uploaded, please try again"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      setState(() {});
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF9EC),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFF9EC),
        title: Text("Pick an image"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            SizedBox(
              width: double.infinity,
              height: 300,
              child: image == null
                  ? Image.asset("assets/images/placeholder_image.png")
                  : Image.file(File(image!.path)),
            ),
            SizedBox(
              height: 300,
              child: Container(
                // color: Colors.amber,
                child: Stepper(
                  elevation: 5,
                  controlsBuilder: (context, details) {
                    return SizedBox(
                      width: 500,
                    );
                  },
                  currentStep: currentStep,
                  steps: [
                    Step(
                        title: Text(
                          "Pick An Image of Brain's MRI scan",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xFF0D253F),
                              fontSize: 15,
                              letterSpacing: 1),
                        ),
                        content: ElevatedButton(
                          onPressed: () async {
                            startLoading = true;
                            setState(() {});
                            bool pickedimaged = await pickImageHandler();
                            startLoading = false;
                            setState(() {});
                            if (pickedimaged) {
                              currentStep++;
                              setState(() {});
                            }
                          },
                          child: Text("Pick Image"),
                        ),
                        isActive: currentStep > 0,
                        state: currentStep > 0
                            ? StepState.complete
                            : StepState.indexed),
                    Step(
                        title: Text(
                          "Upload to backend",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xFF0D253F),
                              fontSize: 15,
                              letterSpacing: 1),
                        ),
                        content: ElevatedButton(
                          onPressed: () async {
                            startLoading = true;
                            setState(() {});
                            bool backendUpload = await uploadPhoto();
                            startLoading = false;
                            setState(() {});
                            if (backendUpload) {
                              currentStep++;
                              setState(() {});
                            }
                          },
                          child: Text("Upload to backend"),
                        ),
                        isActive: currentStep >= 1,
                        state: currentStep >= 1
                            ? StepState.complete
                            : StepState.indexed),
                    Step(
                        title: Text(
                          "Process Image",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xFF0D253F),
                              fontSize: 15,
                              letterSpacing: 1),
                        ),
                        content: ElevatedButton(
                          onPressed: () async {
                            startLoading = true;
                            setState(() {});
                            var response =
                                await imagePickerHandlerMRI.processImage();
                            startLoading = false;
                            setState(() {});
                            if (response.containsKey("result")) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ResultMRIScreen(
                                      mpp: response,
                                    ),
                                  ));
                            }
                          },
                          child: Text("Process Image"),
                        ),
                        isActive: currentStep >= 2,
                        state: currentStep >= 2
                            ? StepState.complete
                            : StepState.indexed),
                  ],
                ),
              ),
            ),
            if (startLoading)
              SizedBox(height: 35, child: CircularProgressIndicator())
          ]),
        ),
      ),
    );
  }
}
