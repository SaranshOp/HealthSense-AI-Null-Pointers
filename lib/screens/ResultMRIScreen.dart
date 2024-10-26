import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class ResultMRIScreen extends StatefulWidget {
  const ResultMRIScreen({super.key, required this.mpp});
  final Map<String, dynamic> mpp;

  @override
  State<ResultMRIScreen> createState() => _ResultMRIScreenState();
}

class _ResultMRIScreenState extends State<ResultMRIScreen> {
  final ValueNotifier<double> _valueNotifier = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    List<dynamic> list = widget.mpp["result"];
    logger.w(list);
    return Scaffold(
      backgroundColor: Color(0xFFFFF9EC),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFF9EC),
        title: Text("Alzheimer's Test"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DashedCircularProgressBar.aspectRatio(
          animationDuration: Duration(seconds: 4),
          aspectRatio: 1, // width ÷ height
          valueNotifier: _valueNotifier,
          progress: (double.parse(list[0]["score"].toString()) * 100),
          startAngle: 225,
          sweepAngle: 270,
          foregroundColor: Colors.red,
          backgroundColor: const Color(0xffeeeeee),
          foregroundStrokeWidth: 15,
          backgroundStrokeWidth: 15,
          animation: true,
          seekSize: 6,
          seekColor: const Color(0xffeeeeee),
          child: Center(
            child: ValueListenableBuilder(
                valueListenable: _valueNotifier,
                builder: (_, double value, __) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${value.toInt()}%',
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontSize: 60),
                        ),
                        Text(
                          "${list[0]["label"]} chances (in %)",
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                        ),
                      ],
                    )),
          ),
        ),
      ),
      /*
      Column(
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

       */
    );
  }
}
