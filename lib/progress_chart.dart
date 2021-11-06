import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:flutter/material.dart';

class ProgressChart extends StatelessWidget {
  const ProgressChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      height: MediaQuery.of(context).size.width * 0.35,
      width: MediaQuery.of(context).size.width * 0.35,
      child: SleekCircularSlider(
        min: 0,
        max: 100,
        initialValue: 70,
        appearance: CircularSliderAppearance(
          size: 190,
          angleRange: 300,
          startAngle: 120,
          customWidths: CustomSliderWidths(
            progressBarWidth: 20,
            trackWidth: 14,
            handlerSize: 0,
          ),
          customColors: CustomSliderColors(
            progressBarColors: [
              Color.fromRGBO(62, 134, 218, 1),
              Color.fromRGBO(0, 74, 173, 1),
            ],
            trackColors: [
              Colors.grey.shade300,
              Colors.grey.shade100,
            ],
            shadowColor: Color.fromRGBO(0, 84, 203, 0.1),
          ),
        ),
      ),
    );
  }
}
