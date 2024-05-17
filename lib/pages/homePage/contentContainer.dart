import 'package:collect_the_world/pages/homePage/widgets/collectItemWidget.dart';
import 'package:collect_the_world/pages/homePage/widgets/globalTask.dart';
import 'package:flutter/cupertino.dart';

class ContentContainer extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(30,150,30,85),
      child: Column(
        
        children: [
          CollectItemWidget(),
          GlobalTask(),
        ],
      ),
    );
  }
}
