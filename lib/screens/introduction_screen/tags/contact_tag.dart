import 'package:flutter/material.dart';
import '/main.dart';
import '../../../theme/app_theme.dart';

class ContactTag extends StatelessWidget {
  const ContactTag({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 32, 32, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 32),
            child: SelectableText(
              'Nhất Tín Express API Service',
              style:
                  AppTextTheme.bigText(AppColor.black).copyWith(fontSize: 48),
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: SelectableText(
              ScreenUtil.t(I18nKey.introduce)!,
              style: AppTextTheme.headerTitle(AppColor.black),
            ),
          ),
          SelectableText(
            ScreenUtil.t(I18nKey.introWeb)!,
            style: AppTextTheme.normalHeaderTitle(AppColor.black),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: SelectableText(
              'A. ${ScreenUtil.t(I18nKey.connectorInformation)!.toUpperCase()}',
              style: AppTextTheme.mediumHeaderTitle(AppColor.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SelectableText(
                  '1. ${ScreenUtil.t(I18nKey.host)!}',
                  style: AppTextTheme.mediumBodyText(AppColor.black),
                ),
                _boxContent(ScreenUtil.t(I18nKey.hostContent)!),
                SelectableText(
                  '2. ${ScreenUtil.t(I18nKey.authorization)!}',
                  style: AppTextTheme.mediumBodyText(AppColor.black),
                ),
                _boxContent(ScreenUtil.t(I18nKey.authorizationContent)!),
                SelectableText(
                  '1. ${ScreenUtil.t(I18nKey.webPortal)!}',
                  style: AppTextTheme.mediumBodyText(AppColor.black),
                ),
                _boxContent(ScreenUtil.t(I18nKey.webPortalContentBox)!),
                SelectableText(
                  ScreenUtil.t(I18nKey.webPortalContent)!,
                  style: AppTextTheme.normalHeaderTitle(AppColor.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _boxContent(String title) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.black.withOpacity(0.1),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SelectableText(
            title,
            style: AppTextTheme.normalText(AppColor.black),
          ),
        ),
      ),
    );
  }
}
