import 'package:auto_size_text/auto_size_text.dart';
import 'package:collect_the_world/generatedCode/api.dart';
import 'package:collect_the_world/globals/globalScripts/cachingScripts/multiplierCaching.dart';
import 'package:collect_the_world/globals/globalScripts/systems/serverSideData/serverSideData.dart';
import 'package:collect_the_world/globals/globalWidgets/baseWidget/baseWidget.dart';
import 'package:collect_the_world/pages/homePage/widgets/dailyBonusPopup.dart';
import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DailyBonuses extends StatelessWidget {
  final List<ActiveMultiplier> multiplierList;
  final double maxHeight;

  const DailyBonuses(
      {super.key, required this.multiplierList, required this.maxHeight});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CustomPopupMenu(
        menuBuilder: () => const ClipRRect(child: DailyBonusPopup()),
        position: PreferredPosition.top,
        pressType: PressType.singleClick,
        verticalMargin: -20,
        barrierColor: Colors.transparent,
        child: Container(
          height: 300,
          margin: const EdgeInsets.only(top: 16),
          child: baseWidget(
              child: Container(
            margin: const EdgeInsets.fromLTRB(16, 12, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: const Text(
                    "🏵️ Bonuses",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      BonusWidget(
                          multi: "${ServerSideData().getDailyBonuses[0]}x",
                          name: multiplierList[0].multiplier != 100
                              ? multiplierList[0].category ?? "❌Error"
                              : "Loading"),
                      const SizedBox(width: 12),
                      BonusWidget(
                          multi: "${ServerSideData().getDailyBonuses[1]}x",
                          name: multiplierList[1].multiplier != 100
                              ? multiplierList[1].category ?? "❌Error"
                              : "Loading"),
                      const SizedBox(width: 12),
                      BonusWidget(
                          multi: "${ServerSideData().getDailyBonuses[2]}x",
                          name: multiplierList[2].multiplier != 100
                              ? multiplierList[2].category ?? "❌Error"
                              : "Loading"),
                    ],
                  ),
                )
              ],
            ),
          )),
        ),
      ),
    );
  }
}

class BonusWidget extends StatelessWidget {
  final String multi;
  final String name;

  const BonusWidget({super.key, required this.multi, required this.name});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(129, 87, 129, 1),
                  Color.fromRGBO(119, 80, 119, 1)
                ]),
            borderRadius: BorderRadius.circular(12)),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(multi,
                  style: TextStyle(
                    fontFamily: "Robik-Light",
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  )),
              Container(
                child: AutoSizeText(name,
                    maxLines: 1,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w600)),
              ),
              const SizedBox(height: 10)
            ],
          ),
        ),
      ),
    );
  }
}
