import 'package:collect_the_world/pages/homePage/collectPage/widgets/idkWhatToCallThis/gallery/galleryHomePagePreview.dart';
import 'package:flutter/material.dart';

class GalleryAccepted extends StatelessWidget {
  final List gallerImages;
  const GalleryAccepted({super.key, required this.gallerImages});

  @override
  Widget build(BuildContext context) {
    return gallerImages[0] is List
        ? const Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("🗂️Collected Objects will\nshow up here!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600)),
              ],
            ),
          )
        : SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(width: 5),
                GalleryHomePagePreview(thumbNailData: gallerImages[0]),
                GalleryHomePagePreview(thumbNailData: gallerImages[1]),
                GalleryHomePagePreview(thumbNailData: gallerImages[2]),
                GalleryHomePagePreview(thumbNailData: gallerImages[3]),
                GalleryHomePagePreview(thumbNailData: gallerImages[3]),
              ],
            ),
          );
  }
}
