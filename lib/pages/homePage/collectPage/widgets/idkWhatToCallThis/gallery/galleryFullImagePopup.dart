import 'package:collect_the_world/globals/globalWidgets/loadingWidget.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class GalleryFullImagePopup extends StatefulWidget {
  final String name;
  final String id;
  const GalleryFullImagePopup(
      {super.key, required this.name, required this.id});

  @override
  _GalleryFullImagePopupState createState() => _GalleryFullImagePopupState();
}

class _GalleryFullImagePopupState extends State<GalleryFullImagePopup> {
  bool isLoaded = false;

  

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.sizeOf(context).height / 1.3,
        width: MediaQuery.sizeOf(context).width / 1.1,
        decoration: BoxDecoration(
            color: Colors.black38, borderRadius: BorderRadius.circular(16)),
        child: Column(
          
          children: <Widget>[
            isLoaded
                ? Container()
                : LoadingAnimationWidget.inkDrop(color: Colors.white, size: 50)
          ],
        ),
      ),
    );
  }
}
