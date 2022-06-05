import 'package:flutter/material.dart';
import '/main.dart';
import '../../../theme/app_theme.dart';

class EnvironmentTag extends StatelessWidget {
  const EnvironmentTag({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: Text(
              ScreenUtil.t(I18nKey.environment)!,
              style: AppTextTheme.headerTitle(AppColor.black),
            ),
          ),
          Text(
            ScreenUtil.t(I18nKey.noData)!,
            style: AppTextTheme.normalText(AppColor.black),
          ),
        ],
      ),
    );
  }
}
