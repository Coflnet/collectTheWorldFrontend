import 'package:flutter/material.dart';
import 'package:collect_the_world/globals/globalScripts/globals.dart' as globals;

class ImageWidget extends StatefulWidget{
  const ImageWidget({super.key});


  ImageWidgetState createState() => ImageWidgetState();
}

class ImageWidgetState extends State<ImageWidget> {
  

  @override
  void initState() {
    imageCache.clear();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(70, 40, 70, 25),
      decoration: BoxDecoration(
        border: Border.all(
          width: 3,
          color: Colors.white24,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
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
