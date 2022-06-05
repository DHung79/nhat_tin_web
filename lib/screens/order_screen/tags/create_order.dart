import 'package:flutter/material.dart';
import '/config/data.dart';
import '/main.dart';
import '../../../theme/app_theme.dart';
import '../../../widgets/api_field.dart';
import '../../../widgets/table.dart';
import '../order_screen.dart';

class CreateOrder extends StatelessWidget {
  const CreateOrder({Key? key}) : super(key: key);

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
              'Tạo Vận Đơn',
              style: AppTextTheme.headerTitle(AppColor.blue1),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 8, 32, 16),
            child: Text(
              'Bằng cách gọi API sang NTX, truyền json param vào body theo thông số mô tả trong mục parameters. API này nếu KH lấy theo ID location (Tỉnh/HUyện/Xã) của NTX',
              style: AppTextTheme.normalText(AppColor.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ApiField(
              method: 'POST',
              link:
                  'https://private-anon-023b4f4949-ntexpress.apiary-mock.com/v1/bill/create',
              parameterBox: WebTable(
                columnWidthRatio: parameterBoxHeader,
                numberOfRows: createOrderParameter.length,
                rowBuilder: (index) => rowFor(
                  item: createOrderParameter[index],
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
                '     "s_address": "52A Nguyễn Thái Bình",',
                '     "s_province_id": 50,',
                '     "s_district_id": 5001,',
                '     "s_ward_id": 500101,',
                '     "r_name": "Nguyễn Văn A",',
                '     "r_phone": "0988090909",',
                '     "r_address": "40 Út Tịch",',
                '     "r_province_id": 50,',
                '     "r_district_id": 5001,',
                '     "r_ward_id": 500101,',
                '     "cod_amount": 200000,',
                '     "service_id": 10,',
                '     "payment_method": "NGTTS",',
                '     "weight": 1.3,',
                '     "cargo_content_id": 1,',
                '     "cargo_content": "Quần áo",',
                '     "cargo_value": 1000000,',
                '     "note": "ghi chú đơn hàng"',
                '}"',
                'https://private-anon-023b4f4949-ntexpress.apiary-mock.com/v1/bill/create',
              ],
              statusCode: '200',
              headers: const ['Content-Type:application/json'],
              body: const [
                '{',
                '  "success": true,',
                '  "data":',
                '    {',
                '      "bill_id": 32323,',
                '      "bill_code": "E98789898",',
                '      "ref_code": "SO98789898",',
                '      "status_id": 1,',
                '      "status_name": "Open",',
                '      "cod_amount": 100.000,',
                '      "service_name": "Nhanh",',
                '      "payment_method_code": "NGTTS",',
                '      "payment_method": "NGTTS",',
                '      "total_fee": 28000,',
                '      "cod_fee": 10000,',
                '      "s_name": "NGUYEN VAN A",',
                '      "s_phone": "0999898989",',
                '      "s_address": "52A NGUYEN THAI BINH",',
                '      "s_province_name": "HCM",',
                '      "s_district_name": "TAN BINH",',
                '      "s_ward_name": "PHUONG 4",',
                '      "s_post_code": "09878",',
                '      "s_post_name": "PM09",',
                '      "r_name": "NGUYEN VAN A",',
                '      "r_phone": "0999898989",',
                '      "r_address": "52A NGUYEN THAI BINH",3t',
                '      "r_province_name": "HCM",',
                '      "r_district_name": "TAN BINH",',
                '      "r_ward_name": "PHUONG 4",',
                '      "r_post_name": "NTX_TUYEN_TRA_HANG"',
                '      "package_no": 1,',
                '      "weight": 3.4,',
                '      "cargo_content": "GIAY",',
                '      "cargo_value": 300000,',
                '      "note": "3333"',
                '      "estimated_deliver_time": "2021-01-31 17:30"',
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
