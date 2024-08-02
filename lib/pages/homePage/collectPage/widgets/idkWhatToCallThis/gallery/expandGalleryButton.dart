import 'package:collect_the_world/pages/galleryPage/galleryPageMain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ExpandGalleryButton extends StatelessWidget {
  const ExpandGalleryButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
            onPressed: () => {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            const GalleryPageMain(),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          return child;
                        },
                        transitionDuration: const Duration(milliseconds: 0),
                      ))
                },
            icon: const Icon(
              Icons.zoom_out_map_rounded,
              size: 25,
              color: Colors.white70,
            )),
      ],
    );
  }
}
