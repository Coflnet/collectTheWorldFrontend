import 'package:flutter/material.dart';

class ImagePreviewGallery extends StatelessWidget {
  final thumbNailData;
  const ImagePreviewGallery({super.key, this.thumbNailData});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.memory(
          thumbNailData["imageBytes"],
        ),
      ),
    );
  }
}
