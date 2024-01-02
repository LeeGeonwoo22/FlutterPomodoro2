import 'package:flutter/material.dart';
import 'package:pomodoro2/utils/timerService.dart';
import 'package:pomodoro2/utils/util.dart';
import 'package:provider/provider.dart';

class TimeOptions extends StatelessWidget {
  const TimeOptions({super.key});
  // double selectedTime = 1500;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);
    return SingleChildScrollView(
      controller: ScrollController(initialScrollOffset: 240),
      scrollDirection: Axis.horizontal,
      child: Row(
          children: selectableTimes.map((time) {
        return InkWell(
          onTap: () => provider.selectTime(double.parse(time)),
          // onTap: () => provider.selectedTime = double.parse(time),
          child: Container(
            margin: const EdgeInsets.only(left: 10),
            width: 70,
            height: 50,
            decoration: BoxDecoration(
                color: int.parse(time) == provider.selectedTime
                    ? Colors.white
                    : renderColor(provider.currentState),
                border: Border.all(width: 3, color: Colors.white30),
                borderRadius: BorderRadius.circular(5)),
            child: Center(
                child: Text((int.parse(time) ~/ 60).round().toString(),
                    style: TextStyle(
                        color: int.parse(time) == provider.selectedTime
                            ? renderColor(provider.currentState)
                            : Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w700))),
          ),
        );
      }).toList()),
    );
  }
}
