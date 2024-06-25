import 'package:flutter/material.dart';
import 'package:collect_the_world/globals/globalScripts/globals.dart'
    as globals;

class ImageWidget extends StatefulWidget {
  final double sideMargin;
  const ImageWidget({super.key, this.sideMargin = 35});

  ImageWidgetState createState() => ImageWidgetState();
}

class ImageWidgetState extends State<ImageWidget> {
  @override
  void initState() {
    super.initState();
    imageCache.clear();

    print(globals.timesTaken);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(widget.sideMargin, 30, widget.sideMargin, 25),
      decoration: BoxDecoration(
        border: Border.all(
          width: 4,
          color: Colors.white24,
        ),
        borderRadius: BorderRadius.circular(24),
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
