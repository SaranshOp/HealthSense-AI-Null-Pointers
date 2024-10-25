import 'dart:convert';

import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import "package:logger/logger.dart";

Logger logger = Logger();

class ImagePickerHandlerMRI {
  XFile? image;
  final url = "http://10.0.2.2:5000";

  Future<bool> uploadPhoto() async {
    final uri = Uri.parse(url + "/upload-photo-MRI");
    final request = http.MultipartRequest("POST", uri)
      ..files.add(await http.MultipartFile.fromPath(
        'image',
        image!.path,
        filename: "image",
      ));
    final response = await request.send();
    var resposeval = await http.Response.fromStream(response);
    if (response.statusCode == 200) {
      // logger.w(resposeval.body);
      logger.w("image uploaded successfully");
      return true;
    } else {
      logger.w("image not uploaded");
      return false;
      ;
    }
  }

  Future<Map<String, dynamic>> processImage() async {
    final uri = Uri.parse(url + "/process-image-MRI");
    final response = await http.get(uri);
    return jsonDecode(response.body);
  }
}
