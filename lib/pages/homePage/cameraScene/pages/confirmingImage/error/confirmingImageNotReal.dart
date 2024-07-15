import 'package:collect_the_world/globals/globalWidgets/baseWidget/baseWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ConfirmingImageNotReal extends StatelessWidget {
  const ConfirmingImageNotReal({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.sizeOf(context).height * 0.62,
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: baseWidget(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  textAlign: TextAlign.center,
                  "The name of the item you uploaded doesn't appear to be a real item",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                ),
                const SizedBox(height: 16),
                const Text(
                  textAlign: TextAlign.center,
                  " Only submit real items\n If you think this is wrong please report in our discord with the name of the item and you will be rewarded XP",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 20),
                ),
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
      ),
    );
    ;
  }
}
