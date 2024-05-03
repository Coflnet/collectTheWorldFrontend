import 'package:flutter/material.dart';
import 'package:collect_the_world/globals.dart' as globals;

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(70, 40, 70, 25),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Colors.white24,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: globals.image == null
            ? Container()
            : Image.file(
                globals.image!,
                fit: BoxFit.cover, 
              ),
      ),
    );
  }
}
