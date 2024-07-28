import 'package:collect_the_world/background/backgroundGradiant.dart';
import 'package:collect_the_world/footer/footerMain.dart';
import 'package:collect_the_world/globals/globalScripts/systems/gallerySaving.dart';
import 'package:collect_the_world/pages/galleryPage/galleryPageRow.dart';
import 'package:collect_the_world/pages/homePage/collectPage/widgets/idkWhatToCallThis/gallery/galleryFullImagePopup.dart';
import 'package:flutter/material.dart';

class GalleryPageMain extends StatefulWidget {
  const GalleryPageMain({Key? key}) : super(key: key);

  @override
  _GalleryPageMainState createState() => _GalleryPageMainState();
}

class _GalleryPageMainState extends State<GalleryPageMain> {
  int currentLoadedAmount = 0;
  int loadedAmountOffset = 0;
  List thumbNails = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Stack(
        children: [
          const BackgroundGradiant(),
          ListView.builder(
              itemCount: thumbNails.length,
              itemBuilder: (
                BuildContext context,
                int index,
              ) {
                return GalleryPageRow(items: thumbNails[index]);
              }),
          const Visibility(
              visible: false,
              child: const GalleryFullImagePopup(name: "0", id: "1")),
          const Footer()
        ],
      )),
    );
  }

  void loadData() async {
    final List unproccessedItems =
        await gallerySaving().loadWithOffset(loadedAmountOffset);
    loadedAmountOffset += 20;
    List newListItems = [];
    List tmpItems = [];
    int holding = 0;

    print(unproccessedItems.length);

    for (var i = 0; i < unproccessedItems.length; i++) {
      print(holding);
      if (holding != 2) {
        tmpItems.add(unproccessedItems[i]);
        holding++;
        continue;
      }
      tmpItems.add(unproccessedItems[i]);

      holding = 0;
      newListItems.add(tmpItems);
      tmpItems = [];
    }
    print(newListItems.length);
    setState(() {
      thumbNails.addAll(newListItems);
    });
  }
}
