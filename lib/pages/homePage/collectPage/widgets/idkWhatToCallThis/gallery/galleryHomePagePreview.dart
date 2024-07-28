import 'dart:ffi';
import 'dart:typed_data';

import 'package:collect_the_world/globals/globalScripts/systems/gallerySaving.dart';
import 'package:collect_the_world/pages/homePage/collectPage/widgets/idkWhatToCallThis/gallery/galleryFullImagePopup.dart';
import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';

class GalleryHomePagePreview extends StatelessWidget {
  final thumbNailData;
  const GalleryHomePagePreview({super.key, required this.thumbNailData});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: const EdgeInsets.all(8),
      child: thumbNailData is List
          ? Container()
          : ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.memory(
              thumbNailData.imageBytes,
            ),
          ),
    );
  }
}
