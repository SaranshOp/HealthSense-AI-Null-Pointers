import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import "package:logger/logger.dart";

import '../widgets/alzehimer_test.dart';
import '../widgets/pneumonia_test.dart';
import '../widgets/top_container.dart';

final logger = Logger();

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List<List<Color>> bannerCards = [
  [
    Color(0xffa1d4ed),
    Color(0xffc0eaff),
  ],
  [
    Color(0xffb6d4fa),
    Color(0xffcfe3fc),
  ],
];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      TopContainer(
        height: 200,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(5),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(Icons.menu, color: Color(0xFF0D253F), size: 30.0),
                  Icon(Icons.search, color: Color(0xFF0D253F), size: 25.0),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 0.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Color(0xFF0D253F),
                      radius: 35.0,
                      backgroundImage: AssetImage(
                        'assets/images/xRay_photo.png',
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Text(
                            'Sourav Suman',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 22.0,
                              color: Color(0xFF0D253F),
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            'App Developer',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black45,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ]),
      ),
      Container(
        padding: EdgeInsets.only(left: 23, bottom: 10),
        alignment: Alignment.centerLeft,
        child: Text(
          "We care for you",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.blue[800],
              fontWeight: FontWeight.bold,
              fontSize: 18),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Container(
            //alignment:  Alignment.centerLeft,
            //width: MediaQuery.of(context).size.width,
            height: 140,
            margin: EdgeInsets.only(left: 0, right: 0, bottom: 20),
            padding: EdgeInsets.only(left: 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                stops: [0.3, 0.7],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: bannerCards[0],
              ),
            ),
            child: Stack(
              children: [
                Image.asset(
                  "assets/images/xRay_photo.png",
                  fit: BoxFit.fitHeight,
                ),
                Container(
                  padding: EdgeInsets.only(top: 7, right: 5),
                  alignment: Alignment.topRight,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Test",
                        //'Check Disease',
                        style: TextStyle(
                          color: Colors.lightBlue[900],
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      Icon(
                        Icons.chevron_right_rounded,
                        color: Colors.lightBlue[900],
                        size: 20,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      Container(
        padding: EdgeInsets.only(left: 20),
        alignment: Alignment.centerLeft,
        child: Text(
          "Specialists",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.blue[800],
              fontWeight: FontWeight.bold,
              fontSize: 18),
        ),
      ),
      Container(
          height: 200,
          padding: EdgeInsets.only(top: 14),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [PneumoniaTest(), AlzheimerTest()],
          ))
    ]));
    /*
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "/imagePickerScreenXray");
                },
                child: Card(
                  elevation: 10,
                  child: SizedBox(
                    child: Container(
                      color: Color.fromRGBO(237, 236, 244, 1),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 40.0),
                              child: Text(
                                "X-Ray",
                                style: TextStyle(
                                    fontSize: 35, fontFamily: "Patrik_Hand"),
                              ),
                            ),
                            SizedBox(
                                height: 100,
                                width: 100,
                                child: Image.asset(
                                  "assets/images/xRay_photo.png",
                                  fit: BoxFit.contain,
                                ))
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "/imagePickerScreenXray");
                },
                child: Card(
                  elevation: 10,
                  child: SizedBox(
                    child: Container(
                      color: Color.fromRGBO(237, 236, 244, 1),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(children: [
                          Text(
                            "MRI",
                            style: TextStyle(
                                fontSize: 30, fontFamily: "Patrik_Hand"),
                          ),
                          SizedBox(
                            width: 55,
                            child: Container(
                              color: Colors.amber,
                            ),
                          )
                        ]),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "/imagePickerScreenXray");
                },
                child: Card(
                  elevation: 10,
                  child: SizedBox(
                    child: Container(
                      color: Color.fromRGBO(237, 236, 244, 1),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              "Placeholder",
                              style: TextStyle(
                                  fontSize: 30, fontFamily: "Patrik_Hand"),
                            ),
                            SizedBox(
                              width: 55,
                              child: Container(
                                color: Colors.amber,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "/imagePickerScreenXray");
                },
                child: Card(
                  elevation: 10,
                  child: SizedBox(
                    child: Container(
                      color: Color.fromRGBO(237, 236, 244, 1),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              "Generate Report",
                              style: TextStyle(
                                  fontSize: 30, fontFamily: "Patrik_Hand"),
                            ),
                            SizedBox(
                              width: 55,
                              child: Container(
                                color: Colors.amber,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

       */
  }
}
