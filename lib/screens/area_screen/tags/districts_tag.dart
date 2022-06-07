import 'package:flutter/material.dart';
import '/main.dart';
import '../../../theme/app_theme.dart';
import '../../../widgets/api_field.dart';

class DistrictsTag extends StatelessWidget {
  const DistrictsTag({Key? key}) : super(key: key);

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
            padding: const EdgeInsets.fromLTRB(0, 32, 0, 16),
            child: SelectableText(
              ScreenUtil.t(I18nKey.districts)!,
              // 'Thông tin Quận Huyện',
              style: AppTextTheme.headerTitle(AppColor.blue1),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: ApiField(
              method: ApiMethod.get,
              link:
                  'https://private-anon-023b4f4949-ntexpress.apiary-mock.com/v1/loc/districts?province_id',
              request: [
                'curl --include',
                'https://private-anon-023b4f4949-ntexpress.apiary-mock.com/v1/loc/districts?{province_id}',
              ],
              statusCode: '200',
              headers: ['Content-Type:application/json'],
              body: [
                '{',
                '  "success": true,',
                '  "data": [',
                '    {',
                '      "id": 1,',
                '      "district_name": "Quận 1",',
                '      "province_name": "Hồ Chí Minh"',
                '    },',
                '    {',
                '      "id": 2,',
                '      "district_name": "Quận 2",',
                '      "province_name": "Hồ Chí Minh"',
                '    }',
                '  ]',
                '}',
              ],
            ),
          ),
        ],
      ),
    );
  }
}
