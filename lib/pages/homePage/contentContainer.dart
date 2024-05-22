import 'package:collect_the_world/pages/homePage/widgets/collectItemWidget.dart';
import 'package:collect_the_world/pages/homePage/widgets/globalTask.dart';
import 'package:flutter/cupertino.dart';

class ContentContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(24, 129, 24, 90),
      child: Column(
        children: [
          CollectItemWidget(),
          GlobalTask(),
          GlobalTask(),
        ],
      ),
    );
  }
}
