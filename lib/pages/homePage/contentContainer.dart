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
    return 
    NotificationListener<OverscrollIndicatorNotification>(
       onNotification: (OverscrollIndicatorNotification notification) {
            notification.disallowIndicator();
            return false;
          },
      child: Container(
          margin: const EdgeInsets.fromLTRB(24, 133, 24, 0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 190,
                  child: CollectItemWidget(),
                ),
                DailyItems(itemCollectCount: collectionPercentage),
                const GalleryMain(),
                SizedBox(
                  height: 190,
                  child: DailyBonuses(
                    multiplierList: multiplierList,
                  ),
                ),
                const SizedBox(
                  height: 95,
                )
              ],
            ),
          )),
    );
  }
}
