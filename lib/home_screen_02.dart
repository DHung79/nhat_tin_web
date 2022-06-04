import 'package:nhat_tin_web/main.dart';
import 'package:nhat_tin_web/routers/route_names.dart';
import 'package:flutter/material.dart';
import 'package:nhat_tin_web/routers/navigator_type.dart';
import 'package:nhat_tin_web/screens/tag2/tag2.dart';
import 'tag_sections.dart';

class HomeScreen2 extends StatelessWidget {
  final ValueNotifier<NavigatorType?> tagNotifier;

  const HomeScreen2({
    Key? key,
    required this.tagNotifier,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tags = ['1'];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ValueListenableBuilder(
                  valueListenable: tagNotifier,
                  builder: (BuildContext context, NavigatorType? value,
                      Widget? child) {
                    return SizedBox(
                      width: 200,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blueAccent,
                            ),
                            child: InkWell(
                              onTap: () {
                                navigateTo(introductionRoute);
                              },
                              child: const Center(
                                child: Text(
                                  introductionRoute,
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: InkWell(
                              onTap: () {
                                navigateTo(areaRoute);
                              },
                              child: const Center(
                                child: Text(
                                  areaRoute,
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                Expanded(
                  child: TagSections(
                    tags: tags,
                    tagNotifier: tagNotifier,
                    tagContent: const [
                      Tag2(
                        title: 'Testing color',
                        color: Colors.amber,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
