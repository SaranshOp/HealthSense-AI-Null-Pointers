import 'package:http/http.dart' as http;

class generateReportHandler {
  final url = "http://10.0.2.2:5000";
  Future<String> getAdvice() async {
    final uri = Uri.parse(url + "/get-advice");
    final response = await http.get(uri);
    return response.body;
  }
}
