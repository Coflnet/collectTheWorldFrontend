import 'package:collect_the_world/globals/globalScripts/cachingScripts/listCaching.dart';
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

  final controller = ScrollController();
  int currentOffset = 0;

  @override
  void initState() {
    super.initState();
    requestItems();

    // Setup the listener.
    controller.addListener(() {
      if (controller.position.atEdge) {
        bool isTop = controller.position.pixels == 0;
        if (isTop) {
        } else {
          loadMore();
        }
      }
    });
  }

  void loadMore() async {
    Set addList = await ListCaching().loadNewestOffset(currentOffset);
    setState(() {
      currentOffset += 10;
      items.addAll(addList);
    });
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
                            controller: controller,
                            shrinkWrap: true,
                            itemCount: items.length + 1,
                            itemBuilder: (BuildContext context, int index) {
                              if (index == 0) {
                                return const SizedBox(
                                  height: 16,
                                );
                              } else {
                                index = index - 1;
                                return NewestItemWidget(
                                  name: items[index].name,
                                  xp: items[index].value,
                                  index: index,
                                );
                              }
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
    final newList = ListCaching().loadNewestCache();
    setState(() {
      items.addAll(newList);
      currentOffset = 10;
    });
  }
}
