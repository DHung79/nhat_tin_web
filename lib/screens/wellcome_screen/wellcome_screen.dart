import 'package:flutter/material.dart';
import 'package:nhat_tin_web/theme/button_theme.dart';

import '../../theme/app_theme.dart';

class WellComeScreen extends StatelessWidget {
  const WellComeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, size) {
      return Column(
        children: [
          Text(
            'Nhất Tín Express',
            style: AppTextTheme.bigText(AppColor.yellow1),
          ),
          Text(
            'API Service',
            style: AppTextTheme.mediumHeaderTitle(AppColor.yellow2),
          ),
          AppButtonTheme.fillRounded(
              child: Row(
            children: [
              Text('Bắt Đầu'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.arrow_forward_rounded,
                  size: 24,
                  color: AppColor.white,
                ),
              ),
            ],
          )),
        ],
      );
    });
  }
}
