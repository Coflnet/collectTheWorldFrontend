import 'package:collect_the_world/generatedCode/api.dart';
import 'package:collect_the_world/pages/homePage/collectPage/widgets/idkWhatToCallThis/gallery/galleryMain.dart';
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
        margin: const EdgeInsets.fromLTRB(24, 133, 24, 0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final maxHeight = constraints.maxHeight;
            return Column(
              children: [
                SizedBox(
                  height: (maxHeight / 4).clamp(130, 800),
                  child: CollectItemWidget(constaints: maxHeight),
                ),
                DailyItems(itemCollectCount: collectionPercentage),
                const GalleryMain(),
                SizedBox(
                  height: (maxHeight / 4).clamp(100, 400),
                  child: DailyBonuses(
                    maxHeight: maxHeight,
                    multiplierList: multiplierList,
                  ),
                ),
                SizedBox(
                  height: 95,
                )
              ],
            );
          },
        ));
  }
}
