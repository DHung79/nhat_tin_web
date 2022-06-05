import 'package:flutter/material.dart';
import '../../../main.dart';
import '../../../routers/navigator_type.dart';
import '../../../routers/route_names.dart';
import '../../../theme/app_theme.dart';

class SideBar extends StatefulWidget {
  final String route;
  final ValueNotifier<NavigatorType?> tagNotifier;
  final Color? color;
  const SideBar({
    Key? key,
    required this.route,
    required this.tagNotifier,
    this.color,
  }) : super(key: key);

  @override
  SideBarState createState() => SideBarState();
}

class SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    final List<SideBarItem> sideBarItems = [
      SideBarItem(
        title: ScreenUtil.t(I18nKey.introduce)!,
        route: introducationRoute,
        tags: [
          ScreenUtil.t(I18nKey.contact)!,
          ScreenUtil.t(I18nKey.environment)!,
        ],
      ),
      SideBarItem(
        title: ScreenUtil.t(I18nKey.versions)!,
        route: versionsRoute,
        tags: [
          'B1 ver 1.0.0',
          'B1 ver 1.0.1',
        ],
      ),
      SideBarItem(
        title: ScreenUtil.t(I18nKey.verification)!,
        route: verificationRoute,
        tags: [
          ScreenUtil.t(I18nKey.personalAccessTokens)!,
          ScreenUtil.t(I18nKey.passwordGrantTokens)!,
        ],
      ),
      SideBarItem(
        title: ScreenUtil.t(I18nKey.area)!,
        route: areaRoute,
        tags: [
          ScreenUtil.t(I18nKey.provinces)!,
          ScreenUtil.t(I18nKey.districts)!,
          ScreenUtil.t(I18nKey.wards)!,
        ],
      ),
      SideBarItem(
        title: ScreenUtil.t(I18nKey.order)!,
        route: orderRoute,
        tags: [
          ScreenUtil.t(I18nKey.printBillOfLading)!,
          ScreenUtil.t(I18nKey.createBillOfLading)!,
          ScreenUtil.t(I18nKey.createBillOfLadingVer2)!,
          ScreenUtil.t(I18nKey.trackingBillOfLading)!,
          ScreenUtil.t(I18nKey.pricingShippingCost)!,
          ScreenUtil.t(I18nKey.cancelBillOfLading)!,
          ScreenUtil.t(I18nKey.sendRequest)!,
        ],
      ),
      SideBarItem(
        title: 'Webhooks',
        route: webhooksRoute,
        tags: [],
      ),
    ];

    return Container(
      width: 270,
      decoration: BoxDecoration(
        color: AppColor.yellow1,
      ),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemCount: sideBarItems.length,
        itemBuilder: (context, index) {
          final item = sideBarItems[index];
          return _buildItem(
            item: item,
            active: widget.route == item.route,
            onPressed: () {
              setState(() {
                navigateTo(item.route);
              });
            },
          );
        },
      ),
    );
  }

  Widget _buildItem({
    Function()? onPressed,
    required bool active,
    required SideBarItem item,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
  }) {
    return ValueListenableBuilder(
      valueListenable: widget.tagNotifier,
      builder: (BuildContext context, NavigatorType? value, Widget? child) {
        return Column(
          children: [
            InkWell(
              splashFactory: NoSplash.splashFactory,
              onTap: onPressed,
              // splashColor: Colors.white,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                  color: active ? AppColor.blue1 : AppColor.yellow1,
                  border: Border(
                    left: BorderSide(
                      color: active ? AppColor.white : AppColor.yellow1,
                      width: 4,
                    ),
                  ),
                ),
                constraints: const BoxConstraints(minHeight: 50),
                child: Row(
                  mainAxisAlignment: mainAxisAlignment,
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Text(
                          item.title,
                          style: AppTextTheme.mediumHeaderTitle(
                            active ? AppColor.white : AppColor.black,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            if (widget.route == item.route)
              for (var tag in item.tags)
                LayoutBuilder(
                  builder: (context, size) {
                    final tagIndex = item.tags.indexOf(tag);
                    final routeTags = getTagsOfRoute(widget.route);
                    final selectedTag =
                        value != null ? routeTags.indexOf(value.tag) : 0;
                    return Container(
                      width: size.maxWidth,
                      constraints: const BoxConstraints(minHeight: 50),
                      decoration: BoxDecoration(
                        color: selectedTag == tagIndex
                            ? AppColor.yellow2
                            : AppColor.yellow1,
                      ),
                      child: InkWell(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 32),
                              child: Text(
                                tag,
                                style: AppTextTheme.mediumBodyText(
                                  selectedTag == tagIndex
                                      ? widget.color!
                                      : AppColor.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          navigateTo(item.route + routeTags[tagIndex]);
                        },
                      ),
                    );
                  },
                ),
          ],
        );
      },
    );
  }
}

class SideBarItem {
  final List<String> tags;
  final String title;
  final String route;
  SideBarItem({
    required this.tags,
    required this.title,
    required this.route,
  });
}
