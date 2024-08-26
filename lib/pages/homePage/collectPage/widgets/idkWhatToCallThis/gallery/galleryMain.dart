import 'package:collect_the_world/globals/globalScripts/systems/gallerySaving.dart';
import 'package:collect_the_world/globals/globalWidgets/baseWidget/baseWidget.dart';
import 'package:collect_the_world/pages/homePage/collectPage/widgets/idkWhatToCallThis/gallery/expandGalleryButton.dart';
import 'package:collect_the_world/pages/homePage/collectPage/widgets/idkWhatToCallThis/gallery/galleryFullImagePopup.dart';
import 'package:collect_the_world/pages/homePage/collectPage/widgets/idkWhatToCallThis/gallery/galleryHomePagePreview.dart';
import 'package:flutter/material.dart';

class GalleryMain extends StatefulWidget {
  const GalleryMain({super.key});

  @override
  _GalleryMainState createState() => _GalleryMainState();
}

class _GalleryMainState extends State<GalleryMain> {
  final List gallerImages = gallerySaving().getFirstFive;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.sizeOf(context).width,
        margin: const EdgeInsets.fromLTRB(0, 14, 0, 0),
        child: baseWidget(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              const ExpandGalleryButton(),
              Column(
                children: <Widget>[
                  Text(
                    "🖼️ Gallery",
                    style: TextStyle(
                        color: Colors.grey[300],
                        fontSize: 25,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 4),

            ],
          ),
        ));
  }
}
