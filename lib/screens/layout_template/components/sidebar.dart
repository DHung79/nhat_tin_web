import 'package:flutter/material.dart';
import 'package:nhat_tin_web/routers/route_names.dart';
import '../../../main.dart';
import '../../../theme/app_theme.dart';

class SideBar extends StatefulWidget {
  final String route;
  const SideBar({Key? key, required this.route}) : super(key: key);

  @override
  SideBarState createState() => SideBarState();
}

class SideBarState extends State<SideBar> {
  bool isMini = false;
  @override
  Widget build(BuildContext context) {
    final List<SideBarItem> sideBarItems = [
      SideBarItem(
        icon: Icons.group,
        title: 'Quản lí người dùng',
        route: initialRoute,
      ),
    ];
    final screenSize = MediaQuery.of(context).size;
    if (screenSize.width < 1000) {
      isMini = true;
    }
    return Container(
      width: 356,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: ListView.builder(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: sideBarItems.length,
          itemBuilder: (context, index) {
            final item = sideBarItems[index];
            return _buildItem(
              icon: item.icon,
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
      ),
    );
  }

  Widget _buildItem({
    required IconData? icon,
    Function()? onPressed,
    required bool active,
    required String title,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
  }) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 0, 0),
      child: InkWell(
        splashFactory: NoSplash.splashFactory,
        onTap: onPressed,
        // splashColor: Colors.white,
        highlightColor: Colors.transparent,
        hoverColor: Colors.white12,
        child: Container(
          constraints: const BoxConstraints(minHeight: 56),
          child: Row(
            mainAxisAlignment: mainAxisAlignment,
            children: [
              Icon(
                icon,
                size: 24,
                color: active ? AppColor.blue1 : AppColor.blue2,
              ),
              if (!isMini)
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    title,
                    style: AppTextTheme.normalText(
                      active ? AppColor.blue1 : AppColor.blue2,
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}

class SideBarItem {
  final IconData icon;
  final String title;
  final String route;
  SideBarItem({
    required this.icon,
    required this.title,
    required this.route,
  });
}
