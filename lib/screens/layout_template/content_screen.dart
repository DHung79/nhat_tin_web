import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nhat_tin_web/config/logger/logger.dart';
import 'package:nhat_tin_web/routers/route_names.dart';
import '../../main.dart';
import '../../routers/navigator_type.dart';
import '../../theme/app_theme.dart';
import '../../widgets/jt_search_field.dart';
import 'components/top_navigation_bar.dart';
import 'components/sidebar.dart';

class PageTemplate extends StatefulWidget {
  final Widget child;
  final String route;
  final Widget? wellcome;
  final ValueListenable<NavigatorType?> tagNotifier;

  const PageTemplate({
    Key? key,
    required this.child,
    required this.route,
    this.wellcome,
    required this.tagNotifier,
  }) : super(key: key);

  @override
  State<PageTemplate> createState() => _PageTemplateState();
}

class _PageTemplateState extends State<PageTemplate> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final _searchController = TextEditingController();
  late List<SearchItem> results = [];
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      key: _key,
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, size) {
          return _buildContent();
        },
      ),
    );
  }

  Widget _buildContent() {
    final color = AppColor.blue1;
    final isSearching = _searchController.text.isNotEmpty;
    return Container(
      color: AppColor.white,
      child: Stack(
        children: [
          Column(
            children: [
              TopNavigationBar(
                color: color,
                searchField: SizedBox(
                  width: 265,
                  height: 44,
                  child: JTSearchField(
                    controller: _searchController,
                    cursorHeight: 20,
                    cursorColor: AppColor.black,
                    style: AppTextTheme.normalText(AppColor.black),
                    hoverColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: Colors.white,
                    hintText: 'Tìm kiếm',
                    hintStyle: AppTextTheme.normalText(
                      Colors.grey,
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Icon(
                        Icons.search,
                        color: AppColor.black,
                        size: 24,
                      ),
                    ),
                    suffixIcon: isSearching
                        ? Padding(
                            padding: const EdgeInsets.all(10),
                            child: InkWell(
                              child: Icon(
                                Icons.close,
                                color: AppColor.black,
                                size: 24,
                              ),
                              onTap: () {
                                setState(() {
                                  _searchController.text = '';
                                });
                              },
                            ),
                          )
                        : null,
                    onChanged: (newValue) {
                      setState(() {
                        _searchController.text = newValue;
                        _searchController.selection =
                            TextSelection.collapsed(offset: newValue.length);
                      });
                    },
                  ),
                ),
              ),
              widget.wellcome ??
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SideBar(
                          color: color,
                          route: widget.route,
                          tagNotifier: widget.tagNotifier,
                        ),
                        Expanded(child: widget.child),
                      ],
                    ),
                  ),
            ],
          ),
          if (isSearching) _showSearchResult(),
        ],
      ),
    );
  }

  Widget _showSearchResult() {
    final titles = [
      SearchItem(
        displayName: ScreenUtil.t(I18nKey.introduce)!,
        route: introductionRoute,
      ),
      SearchItem(
        displayName: ScreenUtil.t(I18nKey.versions)!,
        route: versionsRoute,
      ),
      SearchItem(
        displayName: ScreenUtil.t(I18nKey.verification)!,
        route: verificationRoute,
      ),
      SearchItem(
        displayName: ScreenUtil.t(I18nKey.area)!,
        route: areaRoute,
      ),
      SearchItem(
        displayName: ScreenUtil.t(I18nKey.order)!,
        route: orderRoute,
      ),
      SearchItem(
        displayName: 'Webhooks',
        route: webhooksRoute,
      ),
    ];
    final subTitles = [
      SearchItem(
        displayName:
            '${ScreenUtil.t(I18nKey.introduce)!} > ${ScreenUtil.t(I18nKey.contact)!}',
        route: '$introductionRoute/1',
      ),
      SearchItem(
        displayName:
            '${ScreenUtil.t(I18nKey.introduce)!} > ${ScreenUtil.t(I18nKey.environment)!}',
        route: '$introductionRoute/2',
      ),
      SearchItem(
        displayName: 'B1 ver 1.0.0',
        route: '$versionsRoute/1',
      ),
      SearchItem(
        displayName: 'B1 ver 1.0.1',
        route: '$versionsRoute/2',
      ),
      SearchItem(
        displayName:
            '${ScreenUtil.t(I18nKey.verification)!} > ${ScreenUtil.t(I18nKey.personalAccessTokens)!}',
        route: '$verificationRoute/1',
      ),
      SearchItem(
        displayName:
            '${ScreenUtil.t(I18nKey.verification)!} > ${ScreenUtil.t(I18nKey.passwordGrantTokens)!}',
        route: '$verificationRoute/2',
      ),
      SearchItem(
        displayName:
            '${ScreenUtil.t(I18nKey.area)!} > ${ScreenUtil.t(I18nKey.province)!}',
        route: '$areaRoute/1',
      ),
      SearchItem(
        displayName:
            '${ScreenUtil.t(I18nKey.area)!} > ${ScreenUtil.t(I18nKey.district)!}',
        route: '$introductionRoute/2',
      ),
      SearchItem(
        displayName:
            '${ScreenUtil.t(I18nKey.area)!} > ${ScreenUtil.t(I18nKey.wards)!}',
        route: '$introductionRoute/3',
      ),
      SearchItem(
        displayName:
            '${ScreenUtil.t(I18nKey.order)!} > ${ScreenUtil.t(I18nKey.printBillOfLading)!}',
        route: '$orderRoute/1',
      ),
      SearchItem(
        displayName:
            '${ScreenUtil.t(I18nKey.order)!} > ${ScreenUtil.t(I18nKey.createBillOfLading)!}',
        route: '$orderRoute/2',
      ),
      SearchItem(
        displayName:
            '${ScreenUtil.t(I18nKey.order)!} > ${ScreenUtil.t(I18nKey.createBillOfLadingVer2)!}',
        route: '$orderRoute/3',
      ),
      SearchItem(
        displayName:
            '${ScreenUtil.t(I18nKey.order)!} > ${ScreenUtil.t(I18nKey.trackingBillOfLading)!}',
        route: '$orderRoute/4',
      ),
      SearchItem(
        displayName:
            '${ScreenUtil.t(I18nKey.order)!} > ${ScreenUtil.t(I18nKey.pricingShippingCost)!}',
        route: '$orderRoute/5',
      ),
      SearchItem(
        displayName:
            '${ScreenUtil.t(I18nKey.order)!} > ${ScreenUtil.t(I18nKey.cancelBillOfLading)!}',
        route: '$orderRoute/6',
      ),
      SearchItem(
        displayName:
            '${ScreenUtil.t(I18nKey.order)!} > ${ScreenUtil.t(I18nKey.sendRequest)!}',
        route: '$orderRoute/7',
      ),
    ];

    final searchTitles = titles
        .where((e) =>
            e.displayName.toLowerCase().contains(_searchController.text.trim()))
        .toList();
    results = searchTitles;
    if (searchTitles.length < 5) {
      final searchSubTitles = subTitles
          .where((e) => e.displayName
              .toLowerCase()
              .contains(_searchController.text.trim()))
          .toList();
      for (var sub in searchSubTitles) {
        if (results.length < 5) {
          results.add(sub);
        }
      }
    }
    return Positioned(
      right: 232,
      top: 65,
      child: Container(
        width: 300,
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColor.blue1),
        ),
        child: ListView.builder(
          itemCount: min(results.length, 5),
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemBuilder: (content, index) {
            final result = results[index];
            return AppButtonTheme.fillRounded(
              color: AppColor.transparent,
              constraints: const BoxConstraints(minHeight: 50),
              borderRadius: BorderRadius.circular(4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      result.displayName,
                      style: AppTextTheme.normalText(AppColor.black),
                    ),
                  ),
                ],
              ),
              onPressed: () {
                navigateTo(result.route);
              },
            );
          },
        ),
      ),
    );
  }
}

class SearchItem {
  final String displayName;
  final String route;
  SearchItem({
    required this.displayName,
    required this.route,
  });
}
