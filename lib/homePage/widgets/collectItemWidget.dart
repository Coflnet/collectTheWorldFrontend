import 'package:auto_size_text/auto_size_text.dart';
import 'package:collect_the_world/globalWidgets/baseWidget/baseWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CollectItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: baseWidget(
          child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("🔎 Item to find",
                  textScaler: const TextScaler.linear(2.5),
                  style: TextStyle(color: Colors.white.withOpacity(0.9))),
            ],
          ),
          Expanded(
            child: Center(
              child: Container(
                  margin:  const EdgeInsets.all(20),
                  child: AutoSizeText(
                    maxLines: 1,
                    "Apple",
                    style: TextStyle(fontSize: 50, color: Colors.white.withOpacity(0.9)),
                  )),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.white24, width: 1.8)),
                  child: IconButton(
                      onPressed: () => {},
                      icon: const Icon(
                        Icons.camera_alt_outlined,
                        color: Color.fromRGBO(124, 154, 184, 1),
                        size: 40,
                      )),
                ),
                const Row(
                  children: [
                    Text(
                      "+ 200",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    Text(
                      " XP",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ],
                ),
                Container(
                    decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.white24, width: 1.8)),
                    child: IconButton(
                        onPressed: () => {},
                        icon: const Icon(
                          Icons.arrow_forward_rounded,
                          color: Color.fromRGBO(126, 156, 187, 1),
                          size: 40,
                        ))),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
