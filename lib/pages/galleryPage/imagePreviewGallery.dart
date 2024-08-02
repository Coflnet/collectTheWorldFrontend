import 'package:flutter/material.dart';

class ImagePreviewGallery extends StatelessWidget {
  final thumbNailData;
  final void Function(String name, String id) callback;
  const ImagePreviewGallery(
      {super.key, this.thumbNailData, required this.callback});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => {callback(thumbNailData["name"], thumbNailData["id"])},
      child: Column(
        children: [
          Container(
            height: 140,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.memory(
                thumbNailData["imageBytes"],
              ),
            ),
          ),
          Text(
            thumbNailData["name"],
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w700, fontSize: 20),
          )
        ],
      ),
    );
  }
}
