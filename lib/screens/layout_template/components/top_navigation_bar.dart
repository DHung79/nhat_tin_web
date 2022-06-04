import 'package:flutter/material.dart';
import 'package:nhat_tin_web/routers/route_names.dart';
import '../../../main.dart';
import '../../../theme/app_theme.dart';

class TopNavigationBar extends StatefulWidget {
  final Widget searchField;
  final Color? color;
  const TopNavigationBar({
    Key? key,
    this.color,
    required this.searchField,
  }) : super(key: key);

  @override
  State<TopNavigationBar> createState() => _TopNavigationBarState();
}

class _TopNavigationBarState extends State<TopNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.color,
        border: Border(
          bottom: BorderSide(
            color: AppColor.blue1.withOpacity(0.3),
            width: 1,
          ),
        ),
      ),
      height: 72,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _appbarTitle(),
          _actions(),
        ],
      ),
    );
  }

  _appbarTitle() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Nhất Tín Express API Service',
            style: AppTextTheme.headerTitle(
              AppColor.yellow1,
            ),
          ),
        ),
      ],
    );
  }

  _actions() {
    return Row(
      children: [
        widget.searchField,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: InkWell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.notifications,
                color: AppColor.black,
              ),
            ),
            onTap: () {},
          ),
        ),
        _adminInfo(),
      ],
    );
  }

  _adminInfo() {
    final List<NavigatorItem> adminMenuItems = [
      NavigatorItem(
        title: 'Giới thiệu',
        route: introductionRoute,
        tag: '1',
      ),
    ];
    return PopupMenuButton(
      offset: const Offset(0, 50),
      color: AppColor.white,
      onCanceled: () {},
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
        child: Row(
          children: [
            Text(
              'widget.admin.name',
              style: AppTextTheme.normalText(
                AppColor.black,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
          ],
        ),
      ),
      itemBuilder: (context) {
        return adminMenuItems.map((NavigatorItem item) {
          return PopupMenuItem<NavigatorItem>(
            value: item,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      item.title,
                      style: AppTextTheme.normalText(AppColor.black),
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList();
      },
      onSelected: (NavigatorItem item) {
        navigateTo(item.route);
      },
    );
  }
}

class NavigatorItem {
  NavigatorItem({
    required this.title,
    required this.route,
    required this.tag,
  });

  final String title;
  final String route;
  final String tag;
}
