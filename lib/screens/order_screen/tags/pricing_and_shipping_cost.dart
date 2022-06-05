import 'package:flutter/material.dart';
import '/config/data.dart';
import '/main.dart';
import '../../../theme/app_theme.dart';
import '../../../widgets/api_field.dart';
import '../../../widgets/table.dart';
import '../order_screen.dart';

class PricingAndShippingCost extends StatelessWidget {
  const PricingAndShippingCost({Key? key}) : super(key: key);

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
              'Tính giá - phí vận chuyển',
              style: AppTextTheme.headerTitle(AppColor.blue1),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 8, 32, 16),
            child: Text(
              'API tính giá, phí vận chuyển',
              style: AppTextTheme.normalText(AppColor.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ApiField(
              method: 'POST',
              link:
                  'https://private-anon-023b4f4949-ntexpress.apiary-mock.com/v1/bill/calc-fee',
              parameterBox: WebTable(
                columnWidthRatio: parameterBoxHeader,
                numberOfRows: pricingAndShippingCostParameter.length,
                rowBuilder: (index) => rowFor(
                  item: pricingAndShippingCostParameter[index],
                ),
              ),
              request: const [
                'curl --include',
                '     --request POST',
                'https://private-anon-023b4f4949-ntexpress.apiary-mock.com/v1/bill/calc-fee',
              ],
              statusCode: '200',
              headers: const ['Content-Type:application/json'],
              body: const [
                '{',
                '  "success": true,',
                '  "data":',
                '    {',
                '      "total_fee": "122000",',
                '      "weight": 1,',
                '      "cod_fee": "2000",',
                '      "service_name": "Tiết kiệm",',
                '      "service_id": 10,',
                '      "lead_time": "01/02/2021 13:51"',
                '    },',
                '    {',
                '      "total_fee": "122000",',
                '      "weight": 1,',
                '      "cod_fee": "2000",',
                '      "service_name": "Tiết kiệm",',
                '      "service_id": 10,',
                '      "lead_time": "01/02/2021 13:51"',
                '    }',
                '}',
              ],
            ),
          ),
        ],
      ),
    );
  }
}
