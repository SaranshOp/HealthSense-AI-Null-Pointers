import 'package:flutter/material.dart';
import 'package:null_pointers/handlers/imagePickerHandler.dart';
import 'package:logger/logger.dart';
import '../handlers/generateReportHandler.dart';

Logger logger = Logger();

class GetReport extends StatefulWidget {
  const GetReport({super.key});

  @override
  State<GetReport> createState() => _GetReportState();
}

class _GetReportState extends State<GetReport> {
  generateReportHandler ReportHandler = generateReportHandler();
  String res = "";
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
                onPressed: () async {
                  isLoading = true;
                  setState(() {});
                  res = await ReportHandler.getAdvice();
                  isLoading = false;
                  setState(() {});
                  logger.w(res);
                  setState(() {});
                },
                child: Text("Try Me")),
            if (isLoading)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircularProgressIndicator(),
              ),
            if (res.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Text(res),
                ),
              )
          ],
        ),
      ),
    );
  }
}
