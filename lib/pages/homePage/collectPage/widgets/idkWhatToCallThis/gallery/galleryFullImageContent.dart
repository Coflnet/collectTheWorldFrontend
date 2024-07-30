import 'package:flutter/material.dart';

class GalleryFullImageContent extends StatelessWidget {
  final String name;
  final imageData;
  const GalleryFullImageContent(
      {super.key, this.imageData, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            IconButton(
                onPressed: () => {},
                icon: const Icon(
                  Icons.close,
                  color: Colors.white60,
                  size: 30,
                )),
          ],
        ),
        Image.memory(imageData),
        Text(
          name,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 30),
        )
      ],
    );
  }
}
