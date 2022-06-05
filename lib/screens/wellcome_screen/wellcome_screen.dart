import 'package:flutter/material.dart';
import '/main.dart';
import '/routers/route_names.dart';
import '../../theme/app_theme.dart';
import '../layout_template/content_screen.dart';

class WellComeScreen extends StatelessWidget {
  const WellComeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, size) {
      return PageTemplate(
        route: '',
        wellcome: Expanded(
          child: Container(
            width: size.maxWidth,
            color: AppColor.blue1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 64),
                  child: Text(
                    'Nhất Tín Express API Service',
                    style: AppTextTheme.bigText(AppColor.yellow1)
                        .copyWith(fontSize: 48),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32),
                  child: Text(
                    'NhatTin • ntexpress',
                    style: AppTextTheme.bigText(AppColor.yellow2),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: AppButtonTheme.fillRounded(
                    color: AppColor.white,
                    constraints:
                        const BoxConstraints(maxWidth: 180, minHeight: 60),
                    borderRadius: BorderRadius.circular(4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Text(
                            'Bắt Đầu',
                            style: AppTextTheme.bigText(AppColor.blue1),
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_rounded,
                          size: 24,
                          color: AppColor.blue1,
                        ),
                      ],
                    ),
                    onPressed: () {
                      navigateTo(introducationRoute);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        child: const SizedBox(),
      );
    });
  }
}
