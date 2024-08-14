import 'package:collect_the_world/globals/globalWidgets/baseWidget/baseWidget.dart';
import 'package:collect_the_world/pages/homePage/cameraScene/pages/returnPage/returnPageLeaderboardHeader.dart';
import 'package:collect_the_world/pages/homePage/cameraScene/pages/returnPage/returnPageLeaderboardPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReturnPageLeaderboardMain extends StatefulWidget {
  const ReturnPageLeaderboardMain({super.key});

  @override
  _ReturnPageLeaderboardMainState createState() =>
      _ReturnPageLeaderboardMainState();
}

class _ReturnPageLeaderboardMainState extends State<ReturnPageLeaderboardMain> {
  int currentSel = 0;
  Map lbData = {"daily": [], "weekly": [], "exp_overall": []};

  late List<Widget> pages = [
    ReturnPageLeaderboardPage(
        whichOne: "daily", setLBData: setLBData, lbData: lbData),
    ReturnPageLeaderboardPage(
        whichOne: "weekly", setLBData: setLBData, lbData: lbData),
    ReturnPageLeaderboardPage(
        whichOne: "exp_overall", setLBData: setLBData, lbData: lbData)
  ];

  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: currentSel);
  }

  void setLBData(List content, String which) {
    setState(() {
      lbData[which] = content;
    });
  }

  void updateCurrentSelection(int newSelection) {
    setState(() {
      currentSel = newSelection;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(24),
      child: baseWidget(
        child: Container(
          height: MediaQuery.sizeOf(context).height * 0.5,
          child: Column(
            children: <Widget>[
              ReturnPageLeaderboardHeader(
                  selection: currentSel + 1, callBack: changeSel),
              Container(
                margin: const EdgeInsets.only(top: 8),
                height: 2,
                decoration: BoxDecoration(color: Colors.grey.withOpacity(0.4)),
              ),
              Flexible(
                child: PageView.builder(
                  itemBuilder: (context, index) {
                    return pages[index];
                  },
                  controller: pageController,
                  itemCount: pages.length,
                  onPageChanged: (index) {
                    updateCurrentSelection(index);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void changeSel(int newSel) {
    pageController.jumpToPage(newSel);
    setState(() {
      currentSel = newSel;
    });
  }
}
