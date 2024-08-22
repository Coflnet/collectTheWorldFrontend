import 'package:auto_size_text/auto_size_text.dart';
import 'package:collect_the_world/globals/globalScripts/systems/itemToFindUpdater.dart';
import 'package:collect_the_world/globals/globalWidgets/attentionWidget/attentionWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../widgets/collectItemWidget/collectItemCameraButton.dart';

class ItemToFindReturnPage extends StatefulWidget {
  const ItemToFindReturnPage({Key? key}) : super(key: key);

  @override
  _ItemToFindReturnPageState createState() => _ItemToFindReturnPageState();
}

class _ItemToFindReturnPageState extends State<ItemToFindReturnPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      height: MediaQuery.sizeOf(context).height * 0.2,
      child: AttentionWidget(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              margin: const EdgeInsets.fromLTRB(18, 24, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "🔎 Item to find",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.85),
                            fontFamily: "PTSans",
                            fontSize: 25,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 4),
                      child: AutoSizeText(
                        maxLines: 1,
                        textAlign: TextAlign.start,
                        ItemToFindHandler().returnCurrentItem(),
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontWeight: FontWeight.bold,
                            fontSize: 40),
                      )),
                  const SizedBox(height: 24)
                ],
              ),
            ),
          ),
          const CameraButton()
        ],
      )),
    );
  }
}
