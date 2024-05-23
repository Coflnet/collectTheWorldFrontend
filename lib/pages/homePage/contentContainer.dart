import 'package:collect_the_world/pages/homePage/widgets/collectItemWidget.dart';
import 'package:collect_the_world/pages/homePage/widgets/dailyItems.dart';
import 'package:collect_the_world/pages/homePage/widgets/globalTask.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContentContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(24, 129, 24, 90),
      child: Column(
        children: [
          Expanded(
              flex: 3,
              child: Column(
                children: [
                  CollectItemWidget(),
                  const DailyItems(itemCollectCount: 3)
                ],
              )),
          Expanded(
            flex: 5,
            child: Column(
              children: [
                GlobalTask(),
                GlobalTask(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
