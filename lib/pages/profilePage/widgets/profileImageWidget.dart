import 'package:collect_the_world/pages/profilePage/widgets/NameAndPositionWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Profileimagewidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.orangeAccent),
            child: Container(
                margin: EdgeInsets.all(8),
                child: const Icon(
                  Icons.person,
                  color: Colors.white70,
                  size: 40,
                )),
          ),
          const NameAndPositionWidget(),
        ],
        
      ),
    );
  }
}
