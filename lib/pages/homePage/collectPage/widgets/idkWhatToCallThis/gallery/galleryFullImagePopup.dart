
import 'package:collect_the_world/globals/globalScripts/systems/galleryImageRequesting.dart';
import 'package:collect_the_world/globals/globalWidgets/loadingWidget.dart';
import 'package:collect_the_world/pages/homePage/collectPage/widgets/idkWhatToCallThis/gallery/galleryFullImageContent.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class GalleryFullImagePopup extends StatefulWidget {
  final String name;
  final String id;
  final VoidCallback callBack;
  const GalleryFullImagePopup(
      {super.key, required this.name, required this.id, required this.callBack});

  @override
  _GalleryFullImagePopupState createState() => _GalleryFullImagePopupState();
}

class _GalleryFullImagePopupState extends State<GalleryFullImagePopup> {
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    GalleryImageRequesting().requestImage(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextButton(onPressed: () => widget.callBack(), child: Container()),
        Center(
          child: Container(
            height: MediaQuery.sizeOf(context).height / 1.3,
            width: MediaQuery.sizeOf(context).width / 1.1,
            decoration: BoxDecoration(
                color: Colors.black54, borderRadius: BorderRadius.circular(16)),
            child: Column(
              children: <Widget>[
                isLoaded
                    ? GalleryFullImageContent(name: widget.name,)
                    : LoadingAnimationWidget.inkDrop(
                        color: Colors.white, size: 50)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
