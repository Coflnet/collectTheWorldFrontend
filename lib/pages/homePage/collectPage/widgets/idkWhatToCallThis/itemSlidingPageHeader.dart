import 'package:collect_the_world/pages/homePage/collectPage/itemSlidingPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PageChangeNotifer extends ChangeNotifier {
  late SlidingPageHeaderState lbState;

  void setPageState(SlidingPageHeaderState state) {
    lbState = state;
  }

  void changePage(id) {
    lbState.changePageSel(id);
  }
}

class SlidingPageHeader extends StatefulWidget {
  const SlidingPageHeader({super.key});

  @override
  SlidingPageHeaderState createState() => SlidingPageHeaderState();
}

class SlidingPageHeaderState extends State<SlidingPageHeader> {
  int currentSelection = 1;

  var nameTextStyle = ({int sel = 1, int cur = 0}) {
    return TextStyle(
        color: cur == sel ? Colors.white : Colors.white70,
        fontSize: 25,
        fontWeight: FontWeight.w700,
        fontFamily: "Rukik-RLight");
  };

  @override
  Widget build(BuildContext context) {
    Provider.of<PageChangeNotifer>(context, listen: false).setPageState(this);
    return Container(
      decoration: const BoxDecoration(color: Color.fromRGBO(21, 31, 51, 1)),
      height: 95,
      child: Container(
        margin: const EdgeInsets.only(top: 30),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      TextButton(
                        onPressed: () => Provider.of<PageChangeBackNotifer>(
                                context,
                                listen: false)
                            .changePage(0),
                        child: Text("Daily",
                            style:
                                nameTextStyle(sel: 1, cur: currentSelection)),
                      ),
                      TextButton(
                        onPressed: () => Provider.of<PageChangeBackNotifer>(
                                context,
                                listen: false)
                            .changePage(1),
                        child: Text("Newest",
                            style:
                                nameTextStyle(sel: 2, cur: currentSelection)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOutCubic,
              left: MediaQuery.of(context).size.width *
                  getIndicatorPosition(currentSelection),
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                height: 3,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void changePageSel(int id) {
    setState(() {
      currentSelection = id;
    });
  }

  double getIndicatorPosition(int selection) {
    switch (selection) {
      case 1:
        return 0.0;
      case 2:
        return 0.5;
      default:
        return 0;
    }
  }
}
