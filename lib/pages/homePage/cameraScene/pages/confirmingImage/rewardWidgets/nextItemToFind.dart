import 'package:collect_the_world/pages/homePage/cameraScene/pages/confirmingImage/rewardWidgets/rewardWidgetBase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class NextItemToFind extends StatelessWidget {
  final String itemName;
  const NextItemToFind({super.key, required this.itemName});

  @override
  Widget build(BuildContext context) {
    return RewardWidgetBase(
      child: Container(
        height: 80,
        child: Column(
          children: <Widget>[
            const Text(
              "Next Item",
              style: TextStyle(color: Colors.white),
            ),
            Row(
              children: <Widget>[
                NextItemNameLoading(itemName: itemName),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class NextItemNameLoading extends StatelessWidget {
  final String itemName;
  const NextItemNameLoading({super.key, required this.itemName});

  @override
  Widget build(BuildContext context) {
    return itemName == ""
        ? LoadingAnimationWidget.inkDrop(color: Colors.white, size: 20)
        : Text(
            itemName,
            style: TextStyle(color: Colors.white, fontSize: 28),
          );
  }
}
