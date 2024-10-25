import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class ResultMRIScreen extends StatelessWidget {
  const ResultMRIScreen({super.key, required this.mpp});
  final Map<String, dynamic> mpp;

  @override
  Widget build(BuildContext context) {
    List<dynamic> list = mpp["result"];
    logger.w(list);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(list[0]["label"].toString()),
              ),
              Text(" : "),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    (double.parse(list[0]["score"].toString()) * 100)
                            .toStringAsFixed(2) +
                        "%",
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(list[1]["label"].toString()),
              ),
              Text(" : "),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    (double.parse(list[1]["score"].toString()) * 100)
                            .toStringAsFixed(2) +
                        "%",
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(list[2]["label"].toString()),
              ),
              Text(" : "),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    (double.parse(list[2]["score"].toString()) * 100)
                            .toStringAsFixed(2) +
                        "%",
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(list[3]["label"].toString()),
              ),
              Text(" : "),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    (double.parse(list[3]["score"].toString()) * 100)
                            .toStringAsFixed(2) +
                        "%",
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
