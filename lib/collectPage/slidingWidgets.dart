
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:flutter_swipe_detector/flutter_swipe_detector.dart';
import 'package:collect_the_world/collectPage/slidingWigetBox.dart';

typedef void updateCurrentSelection(int currentSelection);

class SlidingWidgets extends StatefulWidget {
  final updateCurrentSelection onUpdate;

  SlidingWidgets({required this.onUpdate});

  @override
  _SlidingWidgetsState createState() => _SlidingWidgetsState();
}

class _SlidingWidgetsState extends State<SlidingWidgets> {
  int currentSelection = 0;
  late PageController _pageController;

  final List<Widget> pages = [
    const SlidingBox(name: "page 1"),
    const SlidingBox(name: "page 2"),
    const SlidingBox(name: "page 3")
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: currentSelection);
  }

  @override
  Widget build(BuildContext context) {
    return SwipeDetector(
        onSwipeLeft: (offset) {
          setState(() {
            print("hello world");
            if (currentSelection < 2) {
              currentSelection++;
              widget.onUpdate(currentSelection);
              _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOutCubic);
            }
          });
        },
        onSwipeRight: (offset) {
          setState(() {
            if (currentSelection > 0) {
              currentSelection--;
              widget.onUpdate(currentSelection);
              _pageController.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOutCubic);
            }
          });
        },
        child: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: pages.length,
              itemBuilder: (context, index) {
                return pages[index];
              },
              onPageChanged: (index) {
                setState(() {
                  currentSelection = index;
                  widget.onUpdate(index);

                });
              },
            ),
          ],
        ));
  }
}
