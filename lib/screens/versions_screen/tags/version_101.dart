import 'package:flutter/material.dart';
import 'package:nhat_tin_web/main.dart';
import '../../../theme/app_theme.dart';

class Version101 extends StatelessWidget {
  const Version101({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 32, 32, 0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
              child: Text(
                'B1 ver 1.0.1',
                style: AppTextTheme.mediumHeaderTitle(AppColor.black),
              ),
            ),
            Center(
              child: Text(
                ScreenUtil.t(I18nKey.noData)!,
                style: AppTextTheme.normalText(AppColor.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}