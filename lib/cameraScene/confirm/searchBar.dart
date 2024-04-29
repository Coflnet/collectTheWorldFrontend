import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class searchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(30, 70, 30, 0),
      child: SearchAnchor(
        builder: (BuildContext context, SearchController controller) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(90),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(

                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 207, 207, 207)
                      .withOpacity(0.04),
                  borderRadius: BorderRadius.circular(55),
                  border: Border.all(
                      color: const Color.fromARGB(43, 255, 255, 255),
                      width: 0.7),
                ),
                child: SearchBar(
                  leading: const Icon(Icons.search, color: Colors.white,),
                  shadowColor: const WidgetStatePropertyAll(Colors.transparent),
                  backgroundColor: WidgetStateProperty.all(Colors.transparent),
                ),
              ),
            ),
          );
        },
        suggestionsBuilder: (context, controller) => {},
      ),
    );
  }
}
