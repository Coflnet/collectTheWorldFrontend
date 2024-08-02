import 'package:collect_the_world/pages/galleryPage/imagePreviewGallery.dart';
import 'package:collect_the_world/pages/homePage/collectPage/widgets/idkWhatToCallThis/gallery/galleryHomePagePreview.dart';
import 'package:flutter/material.dart';

class GalleryPageRow extends StatelessWidget {
  final List items;
  final void Function(String name, String id) callBack;
  const GalleryPageRow(
      {super.key, required this.items, required this.callBack});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 190,
        width: double.infinity,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          for (var item in items)
            item is List
                ? Container()
                : ImagePreviewGallery(
                    thumbNailData: item,
                    callback: callBack,
                  )
        ]));
  }
}
