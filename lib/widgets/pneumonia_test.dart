import 'package:flutter/material.dart';

class PneumoniaTest extends StatelessWidget {
  const PneumoniaTest({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 14),
      height: 150,
      width: 140,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xFFec407a),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              blurRadius: 4.0,
              spreadRadius: 0.0,
              offset: Offset(3, 3),
            ),
          ]),
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, "/imagePickerScreenXray");
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.red))),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 16,
            ),
            Container(
              child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 29,
                  child: Icon(
                    Icons.add,
                    size: 26,
                    color: Color(0xFF5c6bc0),
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Pneumonia Test",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
