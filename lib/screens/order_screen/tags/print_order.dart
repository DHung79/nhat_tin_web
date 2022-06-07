import 'package:flutter/material.dart';
import '/main.dart';
import '../../../theme/app_theme.dart';
import '../../../widgets/api_field.dart';
import '../../../widgets/table.dart';
import '../../../widgets/table_component.dart';
import '../order_screen.dart';

class PrintOrder extends StatelessWidget {
  const PrintOrder({Key? key}) : super(key: key);

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
              ScreenUtil.t(I18nKey.printOrder)!,
              style: AppTextTheme.headerTitle(AppColor.blue1),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ApiField(
              method: ApiMethod.get,
              link:
                  'https://private-anon-023b4f4949-ntexpress.apiary-mock.com/v1/bill/print/:do_code',
              parameterBox: WebTable(
                apiMethod: ApiMethod.get,
                columnWidthRatio: parameterBoxHeader,
                numberOfRows: 1,
                rowBuilder: (index) => TableRow(
                  children: [
                    tableCellText(title: 'do_code'),
                    tableCellText(title: 'Mã vận đơn'),
                    tableCellText(title: 'String - required'),
                  ],
                ),
              ),
              request: const [
                'curl --include',
                'https://private-anon-023b4f4949-ntexpress.apiary-mock.com/v1/bill/print/:do_code',
              ],
              statusCode: '200',
              headers: const ['Content-Type:application/json'],
              body: const [
                '{',
                '  "success": true,',
                '  "message": "Trả về bảng IN"',
                '}',
              ],
            ),
          ),
        ],
      ),
    );
  }
}
