import 'package:flutter/material.dart';

class header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [const headerBackButton(), headerSearchButton()],
      ),
    );
  }
}

class headerSearchButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        margin: EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: const Color.fromRGBO(60, 90, 126, 1),
            border: Border.all(
                color: const Color.fromARGB(30, 87, 119, 158),
                strokeAlign: BorderSide.strokeAlignInside,
                width: 3
                ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: -2,
                blurRadius: 10,
                offset: const Offset(0, 15), 
              ),
            ]),
        child: IconButton(
            iconSize: 40,
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            )));
  }
}

class headerBackButton extends StatelessWidget {
  const headerBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
          onPressed: () {},
          child: const Text(
            style: TextStyle(color: Colors.white),
            "< object list",
            textScaler: TextScaler.linear(2.8),
          )),
    );
  }
}

