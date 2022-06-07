import 'package:flutter/material.dart';
import '/main.dart';
import '../../../theme/app_theme.dart';

class PasswordGrantTokens extends StatelessWidget {
  const PasswordGrantTokens({Key? key}) : super(key: key);

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
              ScreenUtil.t(I18nKey.passwordGrantTokens)!,
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
