import 'package:flutter/material.dart';
import '/main.dart';
import '../../../theme/app_theme.dart';

class Version100 extends StatelessWidget {
  const Version100({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 32, 32, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: SelectableText(
              'B1 ver 1.0.0',
              style: AppTextTheme.mediumHeaderTitle(AppColor.black),
            ),
          ),
          Center(
            child: SelectableText(
              ScreenUtil.t(I18nKey.noData)!,
              style: AppTextTheme.normalHeaderTitle(AppColor.black),
            ),
          ),
        ],
      ),
    );
  }
}
