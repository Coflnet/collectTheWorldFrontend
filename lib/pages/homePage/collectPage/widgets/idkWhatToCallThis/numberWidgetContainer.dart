import 'package:collect_the_world/pages/homePage/collectPage/widgets/idkWhatToCallThis/numberWidgets.dart';
import 'package:flutter/cupertino.dart';

class NumberWidgetContainer extends StatelessWidget {
  final int xpCount;

  const NumberWidgetContainer({super.key, required this.xpCount});

  @override
  Widget build(BuildContext context) {
    if (xpCount < 10) {
      return lowestNumber(xpCount: xpCount);
    } else if (xpCount >= 10 && xpCount < 20) {
      return MiddleNumber(xpCount: xpCount);
    } else {
      return BestNumber(xpCount: xpCount);
    }
  }
}
