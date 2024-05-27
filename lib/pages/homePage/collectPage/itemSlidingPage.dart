import 'package:collect_the_world/pages/homePage/collectPage/widgets/dailyItemPage.dart';
import 'package:collect_the_world/pages/homePage/collectPage/widgets/newestItemPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Selectedpage extends StatefulWidget {
  const Selectedpage({super.key});

  @override
  SelectedPageState createState() => SelectedPageState();
}

class SelectedPageState extends State<Selectedpage> {
  int currentSelection = 0;
  late PageController pageController;

  final List<Widget> pages = [
    const DailyItemPage(),
    const NewestItemPage(),
  ];

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: currentSelection);
  }

  void updateCurrentSelection(int newSelection) {
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
            setState(() {
              currentSelection = index;
            });
          },
        )
      ],
    );
  }
}
