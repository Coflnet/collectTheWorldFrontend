import 'package:auto_size_text/auto_size_text.dart';
import 'package:collect_the_world/globals/globalWidgets/baseWidget/baseWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DailyBonuses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(top: 16),
        child: baseWidget(
            child: Container(
          margin: EdgeInsets.fromLTRB(16,12,16,16),
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
              const Expanded(
                child: Row(
                  children: [
                    BonusWidget(multi: "1.25X", name: "Food"),
                    SizedBox(width: 12),
                    BonusWidget(multi: "2X", name: "Plants"),
                    SizedBox(width: 12),
                    BonusWidget(multi: "4X", name: "indoor"),
                  ],
                ),
              )
            ],
          ),
        )),
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
          child: TextButton(
            onPressed: () => {},
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
      ),
    );
  }
}
