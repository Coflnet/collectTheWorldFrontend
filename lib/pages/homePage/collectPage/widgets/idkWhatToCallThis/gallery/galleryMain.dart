import 'package:collect_the_world/globals/globalScripts/systems/gallerySaving.dart';
import 'package:collect_the_world/globals/globalWidgets/baseWidget/baseWidget.dart';
import 'package:collect_the_world/pages/homePage/collectPage/widgets/idkWhatToCallThis/gallery/galleryHomePagePreview.dart';
import 'package:flutter/material.dart';

class GalleryMain extends StatefulWidget {
  const GalleryMain({Key? key}) : super(key: key);

  @override
  _GalleryMainState createState() => _GalleryMainState();
}

class _GalleryMainState extends State<GalleryMain> {
  final gallerImages = gallerySaving().getFirstFive;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
          width: MediaQuery.sizeOf(context).width,
          margin: const EdgeInsets.fromLTRB(24, 14, 24, 0),
          child: baseWidget(
            child: Column(
              children: <Widget>[
                const Text("🖼️ Gallery"),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      GalleryHomePagePreview(thumbNailData: gallerImages[0])
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
