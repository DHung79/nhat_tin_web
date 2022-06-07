import 'package:flutter/material.dart';
import '/main.dart';
import '../../../theme/app_theme.dart';
import '../../../widgets/api_field.dart';
import '../../../widgets/table.dart';
import '../../../widgets/table_component.dart';
import '../order_screen.dart';

class CancelOrder extends StatelessWidget {
  const CancelOrder({Key? key}) : super(key: key);

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
              ScreenUtil.t(I18nKey.cancelOrder)!,
              style: AppTextTheme.headerTitle(AppColor.blue1),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ApiField(
              method: ApiMethod.post,
              link:
                  'https://private-anon-023b4f4949-ntexpress.apiary-mock.com/v1/bill/destroy',
              parameterBox: WebTable(
                apiMethod: ApiMethod.post,
                columnWidthRatio: parameterBoxHeader,
                numberOfRows: 1,
                rowBuilder: (index) => TableRow(
                  children: [
                    tableCellText(title: 'listDocode'),
                    tableCellText(
                        title:
                            "Danh sách Mã vận đơn cần hủy (['E9999999','E8888888']"),
                    tableCellText(title: 'String'),
                  ],
                ),
              ),
              request: const [
                'curl --include',
                '     --request POST',
                'https://private-anon-023b4f4949-ntexpress.apiary-mock.com/v1/bill/destroy'
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
