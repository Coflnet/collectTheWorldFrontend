import 'package:flutter/material.dart';

class lowestNumber extends StatelessWidget {
  final int xpCount;
  const lowestNumber({super.key, required this.xpCount});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(30)),
      child: SizedBox(
        width: 80,
        height: 40,
        child: Center(
          child: Text(
            '${xpCount}XP',
            style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}

class MiddleNumber extends StatelessWidget {
  final int xpCount;
  const MiddleNumber({super.key, required this.xpCount});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromRGBO(40, 46, 109, 1),
          borderRadius: BorderRadius.circular(30)),
      child: SizedBox(
        width: 80,
        height: 40,
        child: Center(
          child: Text(
            '${xpCount}XP',
            style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}

class BestNumber extends StatelessWidget {
  final int xpCount;
  const BestNumber({super.key, required this.xpCount});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromRGBO(109, 40, 100, 1),
          borderRadius: BorderRadius.circular(30)),
      child: SizedBox(
        width: 80,
        height: 40,
        child: Center(
          child: Text(
            '${xpCount}XP',
            style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
