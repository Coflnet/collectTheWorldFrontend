import 'package:collect_the_world/background/backgroundGradiant.dart';
import 'package:collect_the_world/footer/cameraButton.dart';
import 'package:collect_the_world/footer/footerMain.dart';
import 'package:collect_the_world/globals/globalScripts/systems/gallerySaving.dart';
import 'package:collect_the_world/globals/globalScripts/systems/profilePicture.dart';
import 'package:collect_the_world/globals/globalWidgets/header/header.dart';
import 'package:collect_the_world/pages/galleryPage/galleryHeader.dart';
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
  bool popupVis = false;
  String id = "";
  String name = "";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Rubik'),
      home: Scaffold(
        body: Stack(
          children: [
            const BackgroundGradiant(),
            GalleryHeader(),
            Container(
              margin: const EdgeInsets.only(top: 60),
              child: ListView.builder(
                  itemCount: thumbNails.length,
                  itemBuilder: (
                    BuildContext context,
                    int index,
                  ) {
                    return GalleryPageRow(
                      items: thumbNails[index],
                      callBack: changeVisParams,
                    );
                  }),
            ),
            Visibility(
                visible: popupVis,
                child: GalleryFullImagePopup(
                  name: name,
                  id: id,
                  callBack: changeVis,
                )),
            const Footer()
          ],
        ),
        floatingActionButton: const CameraButtonFooter(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  void changeVisParams(String Nname, String Nid) {
    setState(() {
      popupVis = !popupVis;
      name = Nname;
      id = Nid;
    });
  }

  void changeVis() {
    setState(() {
      popupVis = !popupVis;
    });
  }

  void loadData() async {
    final List unproccessedItems =
        await gallerySaving().loadWithOffset(loadedAmountOffset);
    loadedAmountOffset += 20;
    List newListItems = [];
    List tmpItems = [];
    int holding = 0;

    for (var i = 0; i < unproccessedItems.length; i++) {
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
    if (tmpItems.isNotEmpty) {
      tmpItems.addAll([[], [], []]);
      
      newListItems.add(tmpItems);
    }
    setState(() {
      thumbNails.addAll(newListItems);
    });
  }
}
