import 'package:collect_the_world/pages/leaderboard/widgets/header/LeaderboardHeader.dart';
import 'package:collect_the_world/pages/leaderboard/widgets/leaderboardPage/dailyPage/LeaderboardDailyPage.dart';
import 'package:collect_the_world/pages/leaderboard/widgets/leaderboardPage/allTimePage/leaderboardAllTimePage.dart';
import 'package:collect_the_world/pages/leaderboard/widgets/leaderboardPage/weeklyPage/leaderboardWeeklyPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PageChangeBackNotifer extends ChangeNotifier {
  late PageContainerState lbState;

  void setPageState(PageContainerState state) {
    lbState = state;
  }

  void changePage(id) {
    print("1");
    lbState.changePageSel(id);
  }
}

class LeaderBoardPageContainer extends StatefulWidget {
  const LeaderBoardPageContainer({super.key});

  @override
  PageContainerState createState() => PageContainerState();
}

class PageContainerState extends State<LeaderBoardPageContainer> {
  final List<Widget> pages = [
    const LeaderboardDailyPage(),
    const LeaderboardWeeklyPage(),
    const LeaderboardAllTimePage()
  ];
  int currentSelection = 0;
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: currentSelection);
  }

  void updateCurrentSelection(int newSelection) {
    Provider.of<PageChangeNotifer>(context, listen: false)
        .changePage(newSelection + 1);
    setState(() {
      currentSelection = newSelection;
    });
  }

  void changePageSel(int id) {
    pageController.jumpToPage(id);
    setState(() {
      currentSelection = id;
    });
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<PageChangeBackNotifer>(context, listen: false)
        .setPageState(this);
    return Stack(
      children: [
        PageView.builder(
          itemBuilder: (context, index) {
            return pages[index];
          },
          controller: pageController,
          itemCount: pages.length,
          onPageChanged: (index) {
            updateCurrentSelection(index);
          },
        )
      ],
    );
  }
}
