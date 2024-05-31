import 'package:collect_the_world/pages/homePage/collectPage/widgets/idkWhatToCallThis/newestItemsQuest.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewestItemPage extends StatelessWidget {
  const NewestItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Column(
            children: <Widget>[
              Text(
                  'Newest',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white.withOpacity(0.95),
                    fontSize: 34,
                  ),
                ),
                const NewestItemsQuest()
            ],
          ),
        )
      ],
    );
  }
}
