import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DailyStreakCountDown extends StatefulWidget {
  const DailyStreakCountDown({Key? key}) : super(key: key);

  @override
  _DailyStreakCountDownState createState() => _DailyStreakCountDownState();
}

class _DailyStreakCountDownState extends State<DailyStreakCountDown>
    with SingleTickerProviderStateMixin {
  late CustomTimerController controller;

  @override
  void initState() {
    super.initState();
    setState(() {
      controller = CustomTimerController(
          vsync: this,
          begin: getUtcCountDown(),
          end: const Duration(),
          initialState: CustomTimerState.reset,
          interval: CustomTimerInterval.milliseconds);
    });
    controller.start();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle baseStyle = const TextStyle(
        color: Colors.white, fontWeight: FontWeight.w600, fontSize: 24);
    return Column(
      children: <Widget>[
        Text("resets in", style: baseStyle),
        CustomTimer(
            controller: controller,
            builder: (p1, p2) {
              return Text("${p2.hours}:${p2.minutes}:${p2.seconds}", style: baseStyle,);
            })
      ],
    );
  }

  Duration getUtcCountDown() {
    DateTime nowUtc = DateTime.now().toUtc();

    DateTime nextMidnightUtc = DateTime.utc(
      nowUtc.year,
      nowUtc.month,
      nowUtc.day + 1,
    );
    return nextMidnightUtc.difference(nowUtc);
  }
}
