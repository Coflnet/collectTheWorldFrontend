import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DailyItems extends StatelessWidget {
  final int itemCollectCount;

  const DailyItems({super.key, required this.itemCollectCount});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 14),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color.fromRGBO(73, 61, 91, 1)),
      child: Container(
        margin: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "☀ Daily",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 20),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: LinearProgressIndicator(
                  borderRadius: BorderRadius.circular(8),
                  semanticsLabel: "hello world",
                  value: 0.4,
                  minHeight: 20,
                )),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "7/$itemCollectCount",
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontWeight: FontWeight.w100,
                      fontSize: 17),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
