import 'package:flutter/material.dart';
import 'package:nhat_tin_web/routers/route_names.dart';
import '../../../main.dart';
import '../../../theme/app_theme.dart';

class TopNavigationBar extends StatefulWidget {
  final Color? color;
  const TopNavigationBar({
    Key? key,
    this.color,
  }) : super(key: key);

  @override
  State<TopNavigationBar> createState() => _TopNavigationBarState();
}

class _TopNavigationBarState extends State<TopNavigationBar> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    final listSearch = [
      ScreenUtil.t(I18nKey.introduce),
      '${ScreenUtil.t(I18nKey.introduce)!} > ${ScreenUtil.t(I18nKey.contact)!}',
      '${ScreenUtil.t(I18nKey.introduce)!} > ${ScreenUtil.t(I18nKey.environment)!}',
      ScreenUtil.t(I18nKey.versions),
      'B1 ver 1.0.0',
      'B1 ver 1.0.1',
      ScreenUtil.t(I18nKey.verification),
      '${ScreenUtil.t(I18nKey.verification)!} > ${ScreenUtil.t(I18nKey.personalAccessTokens)!}',
      '${ScreenUtil.t(I18nKey.verification)!} > ${ScreenUtil.t(I18nKey.passwordGrantTokens)!}',
      ScreenUtil.t(I18nKey.area),
      '${ScreenUtil.t(I18nKey.area)!} > ${ScreenUtil.t(I18nKey.province)!}',
      '${ScreenUtil.t(I18nKey.area)!} > ${ScreenUtil.t(I18nKey.district)!}',
      '${ScreenUtil.t(I18nKey.area)!} > ${ScreenUtil.t(I18nKey.wards)!}',
      ScreenUtil.t(I18nKey.order),
      '${ScreenUtil.t(I18nKey.order)!} > ${ScreenUtil.t(I18nKey.printBillOfLading)!}',
      '${ScreenUtil.t(I18nKey.order)!} > ${ScreenUtil.t(I18nKey.createBillOfLading)!}',
      '${ScreenUtil.t(I18nKey.order)!} > ${ScreenUtil.t(I18nKey.createBillOfLadingVer2)!}',
      '${ScreenUtil.t(I18nKey.order)!} > ${ScreenUtil.t(I18nKey.trackingBillOfLading)!}',
      '${ScreenUtil.t(I18nKey.order)!} > ${ScreenUtil.t(I18nKey.pricingShippingCost)!}',
      '${ScreenUtil.t(I18nKey.order)!} > ${ScreenUtil.t(I18nKey.cancelBillOfLading)!}',
      '${ScreenUtil.t(I18nKey.order)!} > ${ScreenUtil.t(I18nKey.sendRequest)!}',
      'Webhooks',
    ];
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: InkWell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.cabin,
                color: AppColor.black,
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
