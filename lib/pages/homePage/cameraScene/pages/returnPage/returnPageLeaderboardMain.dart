import 'package:collect_the_world/globals/globalWidgets/baseWidget/baseWidget.dart';
import 'package:collect_the_world/pages/homePage/cameraScene/pages/returnPage/returnPageLeaderboardHeader.dart';
import 'package:collect_the_world/pages/homePage/cameraScene/pages/returnPage/returnPageLeaderboardPage.dart';
import 'package:flutter/cupertino.dart';

class ReturnPageLeaderboardMain extends StatefulWidget {
  const ReturnPageLeaderboardMain({super.key});

  @override
  _ReturnPageLeaderboardMainState createState() =>
      _ReturnPageLeaderboardMainState();
}

class _ReturnPageLeaderboardMainState extends State<ReturnPageLeaderboardMain> {
  int currentSel = 0;
  final List<Widget> pages = [
    const ReturnPageLeaderboardPage(whichOne: "daily"),
    const ReturnPageLeaderboardPage(whichOne: "weekly"),
    const ReturnPageLeaderboardPage(whichOne: "exp_overall")
  ];

  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: currentSel);
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
              ReturnPageLeaderboardHeader(selection: currentSel+1, callBack: changeSel),
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
    setState(() {
      currentSel = newSel;
    });
  }
}
