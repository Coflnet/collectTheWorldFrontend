import 'package:collect_the_world/generatedCode/api.dart';
import 'package:collect_the_world/pages/homePage/widgets/collectItemWidget/collectItemWidget.dart';
import 'package:collect_the_world/pages/homePage/widgets/dailyBonuses.dart';
import 'package:collect_the_world/pages/homePage/widgets/dailyItems.dart';
import 'package:collect_the_world/pages/homePage/widgets/globalTask.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContentContainer extends StatelessWidget {
  final int collectionPercentage;
  final List<ActiveMultiplier> multiplierList;

  const ContentContainer(
      {super.key,
      required this.collectionPercentage,
      required this.multiplierList});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(24, 133, 24, 95),
      child: Column(
        children: [
          Expanded(
              flex: 4,
              child: Column(
                children: [
                  CollectItemWidget(),
                  DailyItems(itemCollectCount: collectionPercentage)
                ],
              )),
          Expanded(
            flex: 6,
            child: Column(
              children: [
                GlobalTask(),
                DailyBonuses(
                  multiplierList: multiplierList,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
