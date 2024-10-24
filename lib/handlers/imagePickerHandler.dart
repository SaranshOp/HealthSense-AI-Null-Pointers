import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import "package:logger/logger.dart";

Logger logger = Logger();

class ImagePickerHandler {
  XFile? image;
  final url = "http://10.0.2.2:5000";

  Future<bool> uploadPhoto() async {
    final uri = Uri.parse(url + "/upload-photo");
    final request = http.MultipartRequest("POST", uri)
      ..files.add(await http.MultipartFile.fromPath(
        'image',
        image!.path,
        filename: "image",
      ));
    final response = await request.send();
    if (response.statusCode == 200) {
      logger.w("image uploaded successfully");
      return true;
    } else {
      logger.w("image not uploaded");
      return false;
    }
  }
}
