import 'package:flutter/material.dart';
import '/main.dart';
import '../../../config/data.dart';
import '../../../theme/app_theme.dart';
import '../../../widgets/api_field.dart';
import '../../../widgets/table.dart';
import '../order_screen.dart';

class SendRequest extends StatelessWidget {
  const SendRequest({Key? key}) : super(key: key);

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
              ScreenUtil.t(I18nKey.sendRequest)!,
              style: AppTextTheme.headerTitle(AppColor.blue1),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 8, 32, 16),
            child: Text(
              ScreenUtil.t(I18nKey.sendRequestContent)!,
              style: AppTextTheme.normalHeaderTitle(AppColor.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ApiField(
              method: ApiMethod.post,
              link:
                  'https://private-anon-023b4f4949-ntexpress.apiary-mock.com/v1/bill/request-edit-bill',
              parameterBox: WebTable(
                apiMethod: ApiMethod.post,
                columnWidthRatio: parameterBoxHeader,
                numberOfRows: sendRequestParameter.length,
                rowBuilder: (index) => rowFor(
                  item: sendRequestParameter[index],
                ),
              ),
              request: const [
                'curl --include',
                '     --request POST',
                'https://private-anon-023b4f4949-ntexpress.apiary-mock.com/v1/bill/request-edit-bill'
              ],
              statusCode: '200',
              headers: const ['Content-Type:application/json'],
              body: const [
                '{',
                '  "success": true,',
                '  "data": [',
                '    {',
                '      "doCode": "E9999999",',
                '      "message": "Bill E9999999 has canceled successful"',
                '    },',
                '    {',
                '      "doCode": "E8888888",',
                '      "message": "Bill E8888888 has canceled successful"',
                '    }',
                '  ]',
                '  "message": "Received Data"',
                '}',
              ],
            ),
          ),
        ],
      ),
    );
  }
}
