import 'package:flutter/material.dart';
import '/config/data.dart';
import '/main.dart';
import '../../../theme/app_theme.dart';
import '../../../widgets/api_field.dart';
import '../../../widgets/table.dart';
import '../order_screen.dart';

class CreateOrderVer2 extends StatelessWidget {
  const CreateOrderVer2({Key? key}) : super(key: key);

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
              ScreenUtil.t(I18nKey.createOrderVer2)!,
              style: AppTextTheme.headerTitle(AppColor.blue1),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 8, 32, 16),
            child: SelectableText(
              ScreenUtil.t(I18nKey.createOrderVer2Content)!,
              style: AppTextTheme.normalHeaderTitle(AppColor.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ApiField(
              method: ApiMethod.post,
              link:
                  'https://private-anon-023b4f4949-ntexpress.apiary-mock.com/v1/bill/create-by-location',
              parameterBox: WebTable(
                apiMethod: ApiMethod.post,
                columnWidthRatio: parameterBoxHeader,
                numberOfRows: createOrderVer2Parameter.length,
                rowBuilder: (index) => rowFor(
                  item: createOrderVer2Parameter[index],
                ),
              ),
              request: const [
                'curl --include',
                '     --request POST',
                '     --header "Content-Type: application/json"',
                '     --data-binary "  {',
                '     "partner_id": 1234,',
                '     "s_name": "Shop A",',
                '     "s_phone": "0988787898",',
                '     "s_address": "52A Nguy???n Th??i B??nh",',
                '     "s_province": "H??? Ch?? Minh",',
                '     "s_district": "Qu???n 1",',
                '     "s_ward_id": "Ph?????ng Nguy???n Th??i B??nh",',
                '     "r_name": "Nguy???n V??n A",',
                '     "r_phone": "0988090909",',
                '     "r_address": "40 ??t T???ch",',
                '     "r_province_id": "H??? Ch?? Minh",',
                '     "r_district_id": "Qu???n T??n B??nh",',
                '     "r_ward_id": "Ph?????ng 4",',
                '     "cod_amount": 200000,',
                '     "service": 10,',
                '     "payment_method": 10,',
                '     "weight": 1.3,',
                '     "cargo_content_id": 1,',
                '     "cargo_content": "Qu???n ??o",',
                '     "cargo_value": 1000000,',
                '     "note": "ghi ch?? ????n h??ng"',
                '}"',
                'https://private-anon-023b4f4949-ntexpress.apiary-mock.com/v1/bill/create-by-location',
              ],
              statusCode: '200',
              headers: const ['Content-Type:application/json'],
              body: const [
                '{',
                '  "success": true,',
                '  "data":',
                '    {',
                '       "bill_code": "E98789898",',
                '       "ref_code": "SO98789898",',
                '       "status_id": 1,',
                '       "status_name": "Open",',
                '       "cod_amount": 100.000',
                '       "service_name": "Nhanh",',
                '       "payment_method": "NGTTS",',
                '       "total_fee": 28000',
                '       "cod_fee": 10000,',
                '       "s_name": "NGUYEN VAN A",',
                '       "s_phone": "0999898989",',
                '       "s_address": "52A NGUYEN THAI BINH",',
                '       "s_province": "HCM",',
                '       "s_district": "TAN BINH",',
                '       "s_ward": "PHUONG 4",',
                '       "s_post_code": "HNI-MP06",',
                '       "r_post_name": "HNI-MP06.HBT"',
                '       "r_name": "NGUYEN VAN A",',
                '       "r_phone": "0999898989",',
                '       "r_address": "52A NGUYEN THAI BINH",3t',
                '       "r_province": "HCM",',
                '       "r_district": "TAN BINH",',
                '       "r_ward": "PHUONG 4",',
                '       "r_post_code": "HNI-MP06",',
                '       "r_post_name": "HNI-MP06.HBT"',
                '       "package_no": 1,',
                '       "weight": 3.4,',
                '       "cargo_content": "GIAY",',
                '       "cargo_value": 300000,',
                '       "note": "3333"',
                '       "estimated_deliver_time": "2021-01-31 17:30"',
                '    },',
                '}',
              ],
            ),
          ),
        ],
      ),
    );
  }
}
