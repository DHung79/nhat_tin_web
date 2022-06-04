import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nhat_tin_web/routers/route_names.dart';
import '../../../main.dart';
import '../../../routers/navigator_type.dart';
import '../../../theme/app_theme.dart';

class SideBar extends StatefulWidget {
  final String route;
  final ValueListenable<NavigatorType?> tagNotifier;
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
  bool isMini = false;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    final List<SideBarItem> sideBarItems = [
      SideBarItem(
        title: ScreenUtil.t(I18nKey.introduce)!,
        route: initialRoute,
        numberOfTag: 2,
      ),
      SideBarItem(
        title: ScreenUtil.t(I18nKey.versions)!,
        route: versionsRoute,
        numberOfTag: 2,
      ),
      SideBarItem(
        title: ScreenUtil.t(I18nKey.verification)!,
        route: verificationRoute,
        numberOfTag: 2,
      ),
      SideBarItem(
        title: ScreenUtil.t(I18nKey.area)!,
        route: areaRoute,
        numberOfTag: 3,
      ),
      SideBarItem(
        title: ScreenUtil.t(I18nKey.order)!,
        route: orderRoute,
        numberOfTag: 7,
      ),
      SideBarItem(
        title: 'Webhooks',
        route: webhooksRoute,
        numberOfTag: 0,
      ),
    ];
    final screenSize = MediaQuery.of(context).size;
    if (screenSize.width < 1000) {
      isMini = true;
    }
    return ValueListenableBuilder(
        valueListenable: widget.tagNotifier,
        builder: (BuildContext context, NavigatorType? value, Widget? child) {
          return Container(
            width: 250,
            decoration: BoxDecoration(
              color: widget.color,
            ),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: sideBarItems.length,
              itemBuilder: (context, index) {
                final item = sideBarItems[index];
                return _buildItem(
                  title: item.title,
                  active: selectedPage == index,
                  onPressed: () {
                    setState(() {
                      selectedPage = index;
                      navigateTo(item.route);
                    });
                  },
                );
              },
            ),
          );
        });
  }

  Widget _buildItem({
    Function()? onPressed,
    required bool active,
    required String title,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
  }) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      onTap: onPressed,
      // splashColor: Colors.white,
      highlightColor: Colors.transparent,
      hoverColor: Colors.white12,
      child: Container(
        decoration: BoxDecoration(
          color: active ? AppColor.yellow2 : widget.color,
          border: Border(
            left: BorderSide(
              color: active ? widget.color! : AppColor.blue1,
              width: 3,
            ),
          ),
        ),
        constraints: const BoxConstraints(minHeight: 50),
        child: Row(
          mainAxisAlignment: mainAxisAlignment,
          children: [
            if (!isMini)
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    title,
                    style: AppTextTheme.headerTitle(
                      active ? widget.color! : AppColor.white,
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}

class SideBarItem {
  final int numberOfTag;
  final String title;
  final String route;
  SideBarItem({
    required this.numberOfTag,
    required this.title,
    required this.route,
  });
}
