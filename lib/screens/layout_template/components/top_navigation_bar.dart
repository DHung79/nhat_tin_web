import 'package:flutter/material.dart';
import '/routers/route_names.dart';
import '../../../main.dart';
import '../../../theme/app_theme.dart';

class TopNavigationBar extends StatefulWidget {
  final Widget searchField;
  final Color? color;
  final Function() showMiniSiderBar;
  const TopNavigationBar({
    Key? key,
    this.color,
    required this.searchField,
    required this.showMiniSiderBar,
  }) : super(key: key);

  @override
  State<TopNavigationBar> createState() => _TopNavigationBarState();
}

class _TopNavigationBarState extends State<TopNavigationBar> {
  bool showButton = false;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isMedium = screenSize.width < 950;
    final isMini = screenSize.width < 700;

    return Container(
      decoration: BoxDecoration(
        color: widget.color,
        border: Border(
          bottom: BorderSide(
            color: AppColor.white.withOpacity(0.3),
            width: 1,
          ),
        ),
      ),
      height: 82,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (isMedium)
            AppButtonTheme.fillRounded(
              color: AppColor.transparent,
              constraints: const BoxConstraints(minHeight: 44, maxWidth: 50),
              child: Icon(
                Icons.format_list_bulleted_rounded,
                color: AppColor.white,
                size: 24,
              ),
              onPressed: () {
                widget.showMiniSiderBar();
              },
            ),
          AppButtonTheme.fillRounded(
            color: AppColor.transparent,
            constraints: const BoxConstraints(minHeight: 44),
            child: _appbarTitle(),
            onPressed: () {
              navigateTo(initialRoute);
            },
          ),
          if (!isMini)
            Expanded(
              child: _actions(),
            ),
        ],
      ),
    );
  }

  Widget _appbarTitle() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Nh???t T??n Express API Service',
            style: AppTextTheme.headerTitle(
              AppColor.yellow1,
            ),
          ),
          Text(
            'NhatTin ??? ntexpress',
            style: AppTextTheme.normalText(AppColor.yellow2),
          ),
        ],
      ),
    );
  }

  Widget _actions() {
    final screenSize = MediaQuery.of(context).size;
    final isMini = screenSize.width < 950;

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: widget.searchField,
        ),
        if (!isMini)
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: AppButtonTheme.fillRounded(
              color: AppColor.white,
              constraints: const BoxConstraints(minHeight: 44, minWidth: 130),
              borderRadius: BorderRadius.circular(4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      ScreenUtil.t(I18nKey.guide)!,
                      style: AppTextTheme.mediumBodyText(AppColor.black),
                    ),
                  ),
                ],
              ),
              onPressed: () {
                navigateTo(introducationRoute);
              },
            ),
          ),
        if (!isMini) _adminInfo(),
      ],
    );
  }

  _adminInfo() {
    final List<LanguageItem> adminMenuItems = [
      LanguageItem(
        title: ScreenUtil.t(I18nKey.vietnamese)!,
        supportedLocale: supportedLocales[0],
      ),
      LanguageItem(
        title: ScreenUtil.t(I18nKey.english)!,
        supportedLocale: supportedLocales[1],
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
        padding: const EdgeInsets.only(right: 16),
        child: Container(
          constraints: const BoxConstraints(minHeight: 44),
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
            child: Row(
              children: [
                Text(
                  ScreenUtil.t(I18nKey.language)!,
                  style: AppTextTheme.mediumBodyText(
                    AppColor.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Icon(
                    Icons.arrow_drop_down,
                    color: AppColor.black,
                    size: 24,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      itemBuilder: (context) {
        return adminMenuItems.map((LanguageItem item) {
          final selectedLang =
              context.locale.languageCode == item.supportedLocale.languageCode;
          return PopupMenuItem<LanguageItem>(
            value: item,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    item.title,
                    style: AppTextTheme.normalText(AppColor.black),
                  ),
                  if (selectedLang)
                    Icon(
                      Icons.check,
                      color: AppColor.blue2,
                      size: 24,
                    ),
                ],
              ),
            ),
          );
        }).toList();
      },
      onSelected: (LanguageItem item) {
        context.setLocale(item.supportedLocale);
      },
    );
  }
}

class LanguageItem {
  LanguageItem({
    required this.title,
    required this.supportedLocale,
  });

  final String title;
  final Locale supportedLocale;
}
