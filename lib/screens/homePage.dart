import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import "package:logger/logger.dart";

final logger = Logger();

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;
  void sayHi() async {
    final url = "http://10.0.2.2:5000/hello";
    final response = await http.get(Uri.parse(url));
    logger.w(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text("X Ray Scan"),
                subtitle: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/imagePickerScreenXray");
                    },
                    child: Text("Open Image Picker")),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text("MRI Scan"),
                subtitle: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/imagePickerScreenMRI");
                    },
                    child: Text("Open Image Picker")),
              ),
            ),
          ]),
    ));
  }
}
