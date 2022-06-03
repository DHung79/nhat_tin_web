import 'package:flutter/material.dart';
import 'package:nhat_tin_web/routers/route_names.dart';
import '../../../main.dart';
import '../../../theme/app_theme.dart';

class TopNavigationBar extends StatefulWidget {
  const TopNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  State<TopNavigationBar> createState() => _TopNavigationBarState();
}

class _TopNavigationBarState extends State<TopNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
        Text(
          'widget.subTitle',
          style: AppTextTheme.mediumHeaderTitle(
            AppColor.text1,
          ),
        ),
        const SizedBox(
          width: 24,
        ),
        Text(
          'widget.routeName',
          style: AppTextTheme.normalText(
            AppColor.text7,
          ),
        ),
      ],
    );
  }

  _actions() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: InkWell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.cabin,
                color: AppColor.text7,
                size: 24,
              ),
            ),
            onTap: () {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: InkWell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.notifications,
                color: AppColor.text7,
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
                AppColor.text1,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            const CircleAvatar(
              radius: 12,
              backgroundImage: NetworkImage('assets/images/logo.png'),
            )
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
                      style: AppTextTheme.normalText(AppColor.text1),
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
