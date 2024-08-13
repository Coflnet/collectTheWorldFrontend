import 'package:collect_the_world/background/backgroundGradiant.dart';
import 'package:collect_the_world/footer/cameraButton.dart';
import 'package:collect_the_world/footer/footerMain.dart';
import 'package:collect_the_world/pages/homePage/cameraScene/pages/returnPage/itemToFindReturnPage.dart';
import 'package:collect_the_world/pages/homePage/cameraScene/pages/returnPage/itemToFindReturnPageFooter.dart';
import 'package:collect_the_world/pages/homePage/cameraScene/pages/returnPage/returnPageLeaderboardMain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReturnPageMain extends StatelessWidget {
  const ReturnPageMain({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          BackgroundGradiant(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ItemToFindReturnPage(),
              ReturnPageLeaderboardMain()
            ],
          ),
          ItemToFindReturnPageFooter()
        ],
      ),
    );
  }
}
