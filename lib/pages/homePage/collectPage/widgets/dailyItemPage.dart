import 'package:collect_the_world/pages/homePage/collectPage/widgets/TimerCountDownWidget.dart';
import 'package:collect_the_world/pages/homePage/collectPage/widgets/dailyItemsQuest.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DailyItemPage extends StatelessWidget {
  const DailyItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 3,
          child: Container(
            child: Column(
              children: [
                Text(
                  'Reset in',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white.withOpacity(0.95),
                    fontSize: 24,
                  ),
                ),
                const TimerCountDownWidget(),
                const DailyItemsQuest(),
                Container(
                  margin: const EdgeInsets.only(top: 12),
                  decoration: const BoxDecoration(color: Colors.white30),
                  height: 2,
                )
              ],
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Container(
            child: Container(),
          ),
        )
      ],
    );
  }
}
