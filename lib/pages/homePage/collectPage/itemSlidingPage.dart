import 'package:collect_the_world/pages/homePage/collectPage/widgets/dailyItemPage.dart';
import 'package:collect_the_world/pages/homePage/collectPage/widgets/idkWhatToCallThis/itemSlidingPageHeader.dart';
import 'package:collect_the_world/pages/homePage/collectPage/widgets/newestItemPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class PageChangeBackNotifer extends ChangeNotifier {
  late SelectedPageState lbState;

  void setPageState(SelectedPageState state) {
    lbState = state;
  }

  void changePage(id) {
    print("1");
    lbState.changePageSel(id);
  }
}

class Selectedpage extends StatefulWidget {
  final bool change;
  final int page;

  const Selectedpage({super.key, required this.change, required this.page});

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

  void changePageSel(int id) {
    print("hi");
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
            Provider.of<PageChangeNotifer>(context, listen: false)
                .changePage(index + 1);
            setState(() {
              currentSelection = index;
            });
          },
        )
      ],
    );
  }
}
