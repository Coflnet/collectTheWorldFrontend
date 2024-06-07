import 'package:collect_the_world/pages/leaderboard/widgets/header/LeaderboardHeader.dart';
import 'package:collect_the_world/pages/leaderboard/widgets/leaderboardPage/LeaderboardDailyPage.dart';
import 'package:collect_the_world/pages/leaderboard/widgets/leaderboardPage/leaderboardWeeklyPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LeaderBoardPageContainer extends StatefulWidget {
  const LeaderBoardPageContainer({super.key});

  @override
  PageContainerState createState() => PageContainerState();
}

class PageContainerState extends State<LeaderBoardPageContainer> {
  final List<Widget> pages = [
    const LeaderboardDailyPage(),
    const LeaderboardWeeklyPage()
  ];
  int currentSelection = 0;
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: currentSelection);
  }

  void updateCurrentSelection(int newSelection) {
    print("changed ${newSelection}");
    Provider.of<PageChangeNotifer>(context, listen: false)
        .changePage(newSelection + 1);
    setState(() {
      currentSelection = newSelection;
    });
  }

  @override
  Widget build(BuildContext context) {
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
