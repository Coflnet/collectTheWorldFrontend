import 'dart:math';

import 'package:collect_the_world/globals/globalScripts/cachingScripts/listCaching.dart';
import 'package:collect_the_world/globals/globalScripts/systems/authClient.dart'
    as authclie;
import 'package:collect_the_world/generatedCode/api.dart';
import 'package:collect_the_world/pages/homePage/collectPage/widgets/idkWhatToCallThis/TimerCountDownWidget.dart';
import 'package:collect_the_world/pages/homePage/collectPage/widgets/dailyItemsQuest.dart';
import 'package:collect_the_world/pages/homePage/collectPage/widgets/idkWhatToCallThis/dailyItemWidget.dart';
import 'package:flutter/material.dart';

class DailyItemPage extends StatefulWidget {
  const DailyItemPage({super.key});

  @override
  _DailyItemPageState createState() => _DailyItemPageState();
}

class _DailyItemPageState extends State<DailyItemPage> {
  final List items = [];

  @override
  void initState() {
    super.initState();
    requestItems();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Reset in',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white.withOpacity(0.95),
            fontSize: 24,
          ),
        ),
        const TimerCountDownWidget(),
        const SizedBox(height: 16),
        Container(
          margin: const EdgeInsets.fromLTRB(8, 16, 8, 0),
          decoration: BoxDecoration(
              color: Colors.white30, borderRadius: BorderRadius.circular(8)),
          height: 3,
        ),
        Expanded(
          child: Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 70),
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView.builder(
                      controller: ScrollController(initialScrollOffset: 0),
                      shrinkWrap: true,
                      itemCount: items.length,
                      itemBuilder: (BuildContext context, int index) {
                        return DailyItemWidget(
                          name: items[index].name,
                          xp: items[index].value,
                          index: index,
                        );
                      }),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 60,
                    margin: const EdgeInsets.only(bottom: 70),
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                          Colors.black38,
                          Colors.black26,
                          Colors.transparent,
                        ])),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  void requestItems() async {
    final newList = await ListCaching().getCache();
    setState(() {
      items.addAll(newList);
    });
  }
}
