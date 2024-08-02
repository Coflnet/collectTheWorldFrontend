import 'package:collect_the_world/background/backgroundGradiant.dart';
import 'package:collect_the_world/footer/cameraButton.dart';
import 'package:collect_the_world/footer/footerMain.dart';
import 'package:collect_the_world/pages/homePage/collectPage/itemSlidingPage.dart';
import 'package:collect_the_world/pages/homePage/collectPage/widgets/idkWhatToCallThis/itemSlidingPageHeader.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CapturePage extends StatefulWidget {
  const CapturePage({Key? key}) : super(key: key);

  @override
  _CapturePageState createState() => _CapturePageState();
}

class _CapturePageState extends State<CapturePage> {
  int page = 0;
  bool changed = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Rubik'),
      home: Scaffold(
        body: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => PageChangeNotifer()),
            ChangeNotifierProvider(create: (_) => PageChangeBackNotifer())
          ],
          child: Stack(children: [
            const BackgroundGradiant(),
            Column(
              children: [
                const SizedBox(
                  height: 125,
                ),
                Expanded(
                    child: Selectedpage(
                  page: page,
                  change: changed,
                ))
              ],
            ),
            const SlidingPageHeader(),
            const Footer(),
          ]),
        ),
        floatingActionButton: const CameraButtonFooter(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        backgroundColor: const Color.fromRGBO(34, 40, 49, 1),
      ),
    );
  }

  void changePage() {}
}
