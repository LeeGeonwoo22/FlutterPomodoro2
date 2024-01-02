// ignore: file_names
import 'package:flutter/material.dart';
import 'package:pomodoro2/utils/timerService.dart';
import 'package:pomodoro2/widgets/progressWidget.dart';
import 'package:pomodoro2/widgets/timeOption.dart';
import 'package:pomodoro2/widgets/timecontroller.dart';
import 'package:pomodoro2/widgets/timerCard.dart';
import 'package:provider/provider.dart';
import '../utils/util.dart';

class PomodoroScreen extends StatelessWidget {
  const PomodoroScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);
    return Scaffold(
        backgroundColor: renderColor(provider.currentState),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: renderColor(provider.currentState),
          title: Text("POMOTIMER",
              style: textStyle(25, color: Colors.white, fw: FontWeight.w700)),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.refresh,
                color: Colors.white,
                size: 40,
              ),
              iconSize: 40,
              onPressed: () {
                Provider.of<TimerService>(context, listen: false).reset();
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
              alignment: Alignment.center,
              child: const Column(
                children: [
                  SizedBox(height: 15),
                  TimerCard(),
                  SizedBox(
                    height: 40,
                  ),
                  TimeOptions(),
                  SizedBox(
                    height: 40,
                  ),
                  TimeController(),
                  SizedBox(
                    height: 40,
                  ),
                  ProgressWidget(),
                ],
              )),
        ));
  }
}
