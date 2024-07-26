import 'dart:ffi';
import 'dart:typed_data';

import 'package:collect_the_world/globals/globalScripts/systems/gallerySaving.dart';
import 'package:flutter/material.dart';

class GalleryHomePagePreview extends StatelessWidget {
  final thumbNailData;
  const GalleryHomePagePreview({super.key, required this.thumbNailData});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: thumbNailData is Array ? Container() : Column(
        children: <Widget>[Image.memory(thumbNailData.imageBytes, height: 120,)],
      ),
    );
  }
}