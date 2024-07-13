import 'package:collect_the_world/globals/globalWidgets/baseWidget/baseWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ConfirmingImageNotReal extends StatelessWidget {
  const ConfirmingImageNotReal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.62,
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: baseWidget(
        child: Container(
          child: Column(
            children: <Widget>[
              const Text(
                  "There was an error that we encountered if this continues make an report in the our discord and provide message below"),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(119, 80, 119, 1),
                      borderRadius: BorderRadius.circular(8)),
                  child: Container()),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
