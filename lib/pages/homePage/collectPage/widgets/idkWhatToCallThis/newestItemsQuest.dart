import 'package:collect_the_world/globals/globalWidgets/attentionWidget/attentionWidget.dart';
import 'package:flutter/material.dart';

class NewestItemsQuest extends StatelessWidget {
  const NewestItemsQuest({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(24, 14, 24, 0),
      child: AttentionWidget(
          child: Container(
        margin: const EdgeInsets.fromLTRB(16, 10, 16, 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                child: const Text(
              "⭐ ",
              style: TextStyle(color: Colors.white, fontSize: 40),
            )),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Collect 5 new items",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w700),
                  ),
                  Container(
                    child: Stack(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                child: LinearProgressIndicator(
                                  backgroundColor: Colors.pink[50],
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(8),
                                      bottomLeft: Radius.circular(8)),
                                  semanticsLabel: "hello world",
                                  value: 0.0,
                                  minHeight: 22,
                                  
                                ),
                              ),
                            ),
                            Container(
                                child: Image.asset(
                                  "assets/treasureChestGold.png",
                                  scale: 3.3,
                                ))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 3),
                              child: Text(
                                "0/5",
                                style: TextStyle(
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 3),
                              child: const Text(
                                "10P",
                                style: TextStyle(
                                    color: Colors.transparent,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
