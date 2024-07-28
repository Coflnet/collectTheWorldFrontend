import 'package:collect_the_world/pages/homePage/widgets/dailyItemPopup.dart';
import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DailyItems extends StatefulWidget {
  final int itemCollectCount;
  const DailyItems({super.key, required this.itemCollectCount});

  @override
  _DailyItemsState createState() => _DailyItemsState();
}

class _DailyItemsState extends State<DailyItems>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  double opacity = 0.0;

  @override
  void initState() {
    super.initState();
    print(widget.itemCollectCount);
    _controller = AnimationController(
      duration: const Duration(milliseconds: 900),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomPopupMenu(
        menuOnChange: handleMenuChange,
        verticalMargin: -20,
        barrierColor: Colors.transparent,
        position: PreferredPosition.top,
        menuBuilder: () => AnimatedOpacity(
              opacity: opacity,
              duration: const Duration(milliseconds: 900),
              child: const ClipRRect(
                child: IntrinsicWidth(child: DailyItemPopup()),
              ),
            ),
        pressType: PressType.singleClick,
        child: DailyItemsContent(
          itemCollectCount: widget.itemCollectCount,
        ));
  }

  void handleMenuChange(bool changeState) {
    if (changeState) {
      setState(() {
        opacity = 1.0;
        _controller.forward();
      });
      return;
    }
    setState(() {
      opacity = 0.0;
      _controller.reverse();
    });
  }
}

class DailyItemsContent extends StatelessWidget {
  final int itemCollectCount;
  const DailyItemsContent({super.key, required this.itemCollectCount});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: const EdgeInsets.only(top: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color.fromRGBO(73, 61, 91, 1)),
      child: Container(
        margin: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "☀ Daily",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: LinearProgressIndicator(
                  backgroundColor: Colors.pink[50],
                  borderRadius: BorderRadius.circular(8),
                  value: itemCollectCount == 0 ? 0 : itemCollectCount / 7,
                  minHeight: 20,
                )),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "$itemCollectCount / 7",
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontWeight: FontWeight.w600,
                      fontSize: 17),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
