import 'package:flutter/material.dart';
import '/routers/route_names.dart';
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
  final ValueNotifier<NavigatorType?>? tagNotifier;

  const PageTemplate({
    Key? key,
    required this.child,
    required this.route,
    this.tagNotifier,
    this.wellcome,
  }) : super(key: key);

  @override
  State<PageTemplate> createState() => _PageTemplateState();
}

class _PageTemplateState extends State<PageTemplate> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final _searchController = TextEditingController();
  late List<SearchItem> results = [];
  bool showSideBar = false;
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
    final screenSize = MediaQuery.of(context).size;
    final isMedium = screenSize.width < 950;
    final isMini = screenSize.width < 650;

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
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: Colors.white,
                    hintText: ScreenUtil.t(I18nKey.search),
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
                showMiniSiderBar: () {
                  setState(() {
                    showSideBar = !showSideBar;
                  });
                },
              ),
              widget.wellcome ??
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        if (!isMedium)
                          SideBar(
                            color: color,
                            route: widget.route,
                            tagNotifier: widget.tagNotifier!,
                            showMiniSiderBar: () {
                              setState(() {
                                showSideBar = false;
                              });
                            },
                          ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColor.yellow2,
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: isMini ? 0 : 24,
                                horizontal: isMini ? 0 : 24,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColor.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 24,
                                      color: AppColor.blue1.withOpacity(0.2),
                                    )
                                  ],
                                ),
                                child: widget.child,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
            ],
          ),
          if (isMedium && widget.wellcome == null && showSideBar)
            Padding(
              padding: const EdgeInsets.only(top: 82),
              child: SizedBox(
                height: double.infinity,
                child: SideBar(
                  color: color,
                  route: widget.route,
                  tagNotifier: widget.tagNotifier!,
                  showMiniSiderBar: () {
                    setState(() {
                      showSideBar = false;
                    });
                  },
                ),
              ),
            ),
          if (isSearching)
            Positioned(
              right: isMedium ? 16 : 294,
              top: 65,
              child: _showSearchResult(),
            ),
        ],
      ),
    );
  }

  Widget _showSearchResult() {
    final titles = [
      SearchItem(
        displayName: ScreenUtil.t(I18nKey.introduce)!,
        route: introducationRoute,
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
        route: introducationRoute + introductionTag1,
      ),
      SearchItem(
        displayName:
            '${ScreenUtil.t(I18nKey.introduce)!} > ${ScreenUtil.t(I18nKey.environment)!}',
        route: introducationRoute + introductionTag2,
      ),
      SearchItem(
        displayName: 'B1 ver 1.0.0',
        route: versionsRoute + versionsTag1,
      ),
      SearchItem(
        displayName: 'B1 ver 1.0.1',
        route: versionsRoute + versionsTag2,
      ),
      SearchItem(
        displayName:
            '${ScreenUtil.t(I18nKey.verification)!} > ${ScreenUtil.t(I18nKey.personalAccessTokens)!}',
        route: verificationRoute + verificationTag1,
      ),
      SearchItem(
        displayName:
            '${ScreenUtil.t(I18nKey.verification)!} > ${ScreenUtil.t(I18nKey.passwordGrantTokens)!}',
        route: verificationRoute + verificationTag2,
      ),
      SearchItem(
        displayName:
            '${ScreenUtil.t(I18nKey.area)!} > ${ScreenUtil.t(I18nKey.provinces)!}',
        route: areaRoute + areaTag1,
      ),
      SearchItem(
        displayName:
            '${ScreenUtil.t(I18nKey.area)!} > ${ScreenUtil.t(I18nKey.districts)!}',
        route: areaRoute + areaTag2,
      ),
      SearchItem(
        displayName:
            '${ScreenUtil.t(I18nKey.area)!} > ${ScreenUtil.t(I18nKey.wards)!}',
        route: areaRoute + areaTag3,
      ),
      SearchItem(
        displayName:
            '${ScreenUtil.t(I18nKey.order)!} > ${ScreenUtil.t(I18nKey.printOrder)!}',
        route: orderRoute + orderTag1,
      ),
      SearchItem(
        displayName:
            '${ScreenUtil.t(I18nKey.order)!} > ${ScreenUtil.t(I18nKey.createOrder)!}',
        route: orderRoute + orderTag2,
      ),
      SearchItem(
        displayName:
            '${ScreenUtil.t(I18nKey.order)!} > ${ScreenUtil.t(I18nKey.createOrder)!}',
        route: orderRoute + orderTag3,
      ),
      SearchItem(
        displayName:
            '${ScreenUtil.t(I18nKey.order)!} > ${ScreenUtil.t(I18nKey.createOrderVer2)!}',
        route: orderRoute + orderTag4,
      ),
      SearchItem(
        displayName:
            '${ScreenUtil.t(I18nKey.order)!} > ${ScreenUtil.t(I18nKey.pricingShippingCost)!}',
        route: orderRoute + orderTag5,
      ),
      SearchItem(
        displayName:
            '${ScreenUtil.t(I18nKey.order)!} > ${ScreenUtil.t(I18nKey.cancelOrder)!}',
        route: orderRoute + orderTag6,
      ),
      SearchItem(
        displayName:
            '${ScreenUtil.t(I18nKey.order)!} > ${ScreenUtil.t(I18nKey.sendRequest)!}',
        route: orderRoute + orderTag7,
      ),
    ];

    final searchTitles = titles
        .where((e) => e.displayName
            .toLowerCase()
            .contains(_searchController.text.trim().toLowerCase()))
        .toList();
    results = searchTitles;
    if (searchTitles.length < 5) {
      final searchSubTitles = subTitles
          .where((e) => e.displayName
              .toLowerCase()
              .contains(_searchController.text.trim().toLowerCase()))
          .toList();

      for (var sub in searchSubTitles) {
        if (results.length < 5) {
          if (results
              .where((e) => sub.displayName.startsWith(e.displayName))
              .isEmpty) {
            results.add(sub);
          }
        }
      }
    }
    return Container(
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
              _searchController.clear();
              setState(() {
                showSideBar = false;
              });
            },
          );
        },
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
