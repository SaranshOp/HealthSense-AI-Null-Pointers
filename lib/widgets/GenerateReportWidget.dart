import 'package:flutter/material.dart';
import 'package:null_pointers/screens/get_report.dart';

class GenerateReportWidget extends StatelessWidget {
  const GenerateReportWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return GetReport();
            },
          ));
        },
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
                colors: [
                  Color(0xffa1d4ed),
                  Color(0xffc0eaff),
                ],
              ),
            ),
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                SizedBox(
                  height: 130,
                  child: Image.asset(
                    "assets/images/report.png",
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 7, right: 5),
                  alignment: Alignment.topRight,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Generate Report",
                        //'Check Disease',
                        style: TextStyle(
                          color: Colors.lightBlue[900],
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Icon(
                        Icons.chevron_right_rounded,
                        color: Colors.lightBlue[900],
                        size: 30,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
