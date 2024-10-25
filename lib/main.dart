import 'package:flutter/material.dart';
import 'package:null_pointers/screens/homePage.dart';
import 'package:null_pointers/screens/imagePickerScreenMRI.dart';
import 'package:null_pointers/screens/imagePickerScreenXray.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const HomePage(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/imagePickerScreenXray': (context) => const Imagepickerscreen(),
        '/imagePickerScreenMRI': (context) => const ImagepickerscreenMRI(),
      },
    );
  }
}
