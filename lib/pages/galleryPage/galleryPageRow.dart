import 'package:collect_the_world/pages/galleryPage/imagePreviewGallery.dart';
import 'package:collect_the_world/pages/homePage/collectPage/widgets/idkWhatToCallThis/gallery/galleryHomePagePreview.dart';
import 'package:flutter/material.dart';

class GalleryPageRow extends StatelessWidget {
  final List items;
  const GalleryPageRow({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 160,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
          for (var item in items) ImagePreviewGallery(thumbNailData: item)
        ]));
  }
}
