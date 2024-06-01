import 'package:collect_the_world/globals/globalScripts/cachingScripts/listCaching.dart';
import 'package:collect_the_world/pages/homePage/collectPage/widgets/idkWhatToCallThis/dailyItemWidget.dart';
import 'package:collect_the_world/pages/homePage/collectPage/widgets/idkWhatToCallThis/newestItemWidget.dart';
import 'package:collect_the_world/pages/homePage/collectPage/widgets/idkWhatToCallThis/newestItemsQuest.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewestItemPage extends StatefulWidget {
  const NewestItemPage({Key? key}) : super(key: key);

  @override
  NewestItemPageState createState() => NewestItemPageState();
}

class NewestItemPageState extends State<NewestItemPage> {
  final List items = [];

  @override
  void initState() {
    super.initState();
    requestItems();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 8,
              ),
              Text(
                'Newest items',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 40,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const NewestItemsQuest(),
              Container(
                margin: const EdgeInsets.fromLTRB(8, 24, 8, 0),
                decoration: BoxDecoration(
                    color: Colors.white30,
                    borderRadius: BorderRadius.circular(8)),
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
                            controller:
                                ScrollController(initialScrollOffset: 0),
                            shrinkWrap: true,
                            itemCount: items.length,
                            itemBuilder: (BuildContext context, int index) {
                              return NewestItemWidget(
                                name: items[index]["name"],
                                xp: items[index]["xp"],
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
