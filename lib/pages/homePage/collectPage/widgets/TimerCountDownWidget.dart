import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';

class TimerCountDownWidget extends StatefulWidget {
  const TimerCountDownWidget({Key? key}) : super(key: key);

  @override
  _TimerCountDownWidgetState createState() => _TimerCountDownWidgetState();
}

class _TimerCountDownWidgetState extends State<TimerCountDownWidget>
    with SingleTickerProviderStateMixin {
  late CustomTimerController controller = CustomTimerController(
      vsync: this,
      begin: const Duration(hours: 24),
      end: const Duration(),
      initialState: CustomTimerState.reset,
      interval: CustomTimerInterval.milliseconds);

  @override
  void initState() {
    super.initState();
    controller.start();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      child: CustomTimer(
        controller: controller,
        builder: (p1, p2) {
          return Text("${p2.hours}:${p2.minutes}:${p2.seconds}",
              style: const TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.w700));
        },
      ),
    );
  }
}
