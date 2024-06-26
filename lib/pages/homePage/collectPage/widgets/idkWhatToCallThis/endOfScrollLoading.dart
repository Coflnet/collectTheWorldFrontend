import 'package:collect_the_world/globals/globalWidgets/loadingWidget.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class EndOfScrollLoading extends StatelessWidget {
  const EndOfScrollLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: LoadingAnimationWidget.inkDrop(color: Colors.white, size: 40),
    );
  }
}
