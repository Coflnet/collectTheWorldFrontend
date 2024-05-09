import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ConfirmPageSearchBar extends StatefulWidget {
  final ValueChanged<String> onSearchContentChanged;
  final bool isDescrip;

  const ConfirmPageSearchBar(
      {required this.onSearchContentChanged, this.isDescrip = false});

  @override
  _ConfirmPageSearchBarState createState() => _ConfirmPageSearchBarState();
}

class _ConfirmPageSearchBarState extends State<ConfirmPageSearchBar> {
  int remainLetters = 12;
  bool showIcon = true;

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
                  onChanged: (newText) => {
                    widget.onSearchContentChanged(newText),
                    countCharachters(newText)
                  },
                  leading: widget.isDescrip
                      ? null
                      : const Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                  hintText:
                      widget.isDescrip ? "A red apple on brown table" : "",
                  trailing: widget.isDescrip
                      ? [
                          Container(
                            child: searchBarTrailing(
                                icon: showIcon, charachter: remainLetters),
                          )
                        ]
                      : [Container()],
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

  void countCharachters(newText) {
    int count = 0;
    for (int i = 0; i < newText.length; i++) {
      if (newText[i] != ' ') {
        count++;
      }
    }
    setState(() {
      remainLetters = count - 12;
      if (count >= 12) {
        showIcon = false;
      }
    });
  }
}

class searchBarTrailing extends StatelessWidget {
  final bool icon;
  final int charachter;

  const searchBarTrailing(
      {super.key, required this.icon, required this.charachter});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: icon
          ? Text(
              "-$charachter",
              style: const TextStyle(color: Colors.redAccent, fontSize: 20),
            )
          : const Icon(
              Icons.thumb_up_rounded,
              color: Colors.greenAccent,
            ),
    );
  }
}
