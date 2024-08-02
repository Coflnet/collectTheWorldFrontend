import 'package:collect_the_world/globals/extentions/extentions.dart';
import 'package:flutter/material.dart';

class GalleryFullImageContent extends StatelessWidget {
  final String name;
  final imageData;
  final VoidCallback callback;
  const GalleryFullImageContent(
      {super.key, this.imageData, required this.name, required this.callback});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            IconButton(
                onPressed: () => callback(),
                icon: const Icon(
                  Icons.close,
                  color: Colors.white60,
                  size: 43,
                )),
          ],
        ),
        Container(
            height: MediaQuery.of(context).size.height * 0.58,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.memory(
                  imageData,
                  fit: BoxFit.contain,
                ))),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name.capitalize(),
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 36),
              ),
            ],
          ),
        )
      ],
    );
  }
}
