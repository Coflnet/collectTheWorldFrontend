import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Loadingwidget extends StatelessWidget {
  final isVisible;

  const Loadingwidget({super.key, required this.isVisible});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: Container(
        child: LoadingAnimationWidget.inkDrop(color: Colors.white, size: 80),
      ),
    );
  }
}
