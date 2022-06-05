import 'package:flutter/material.dart';
import '/main.dart';
import '../../../theme/app_theme.dart';
import '../../../widgets/api_field.dart';

class ProvincesTag extends StatelessWidget {
  const ProvincesTag({Key? key}) : super(key: key);

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
            child: Text(
              'Thông tin Tỉnh Thành',
              style: AppTextTheme.headerTitle(AppColor.blue1),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: ApiField(
              method: 'GET',
              methodColor: Colors.greenAccent,
              link:
                  'https://private-anon-023b4f4949-ntexpress.apiary-mock.com/v1/loc/provincess',
              request: [
                'curl --include',
                'https://private-anon-023b4f4949-ntexpress.apiary-mock.com/v1/loc/provincess',
              ],
              statusCode: '200',
              headers: ['Content-Type:application/json'],
              body: [
                '{',
                ' "success": true,',
                ' "data": [',
                '   {',
                '      "id": 1,',
                '      "provinces_name": "Hà Nội"',
                '    },',
                '    {',
                '      "id": 2,',
                '      "provinces_name": "Hồ Chí Minh"',
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
