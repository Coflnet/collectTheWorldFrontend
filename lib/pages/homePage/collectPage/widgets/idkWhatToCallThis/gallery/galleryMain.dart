import 'package:collect_the_world/globals/globalScripts/systems/gallerySaving.dart';
import 'package:collect_the_world/globals/globalScripts/systems/legalChangeUploader.dart';
import 'package:collect_the_world/globals/globalWidgets/baseWidget/baseWidget.dart';
import 'package:collect_the_world/pages/homePage/collectPage/widgets/idkWhatToCallThis/gallery/expandGalleryButton.dart';
import 'package:collect_the_world/pages/homePage/collectPage/widgets/idkWhatToCallThis/gallery/galleryAccepted.dart';
import 'package:collect_the_world/pages/profilePage/editProfile/editProfileMain.dart';
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
            child: Stack(alignment: Alignment.topCenter, children: [
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
              LegalChangeUploader().getnewService == false ||
                      LegalChangeUploader().getallowResell == false
                  ? Expanded(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Center(
                                child: Text(
                              textAlign: TextAlign.center,
                              "You declined the use of the images\n change in profile settings",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700),
                            )),
                            TextButton(
                                onPressed: () => {goToSettings()},
                                child: const Text(
                                  "👉 Settings",
                                  style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20),
                                ))
                          ]),
                    )
                  : GalleryAccepted(gallerImages: gallerImages),
            ],
          ),
        ])));
  }

  void goToSettings() {
    Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const EditProfileMain(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
          transitionDuration: const Duration(milliseconds: 0),
        ));
  }
}
