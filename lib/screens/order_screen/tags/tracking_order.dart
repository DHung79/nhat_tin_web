import 'package:flutter/material.dart';
import 'package:nhat_tin_web/main.dart';
import '../../../theme/app_theme.dart';
import '../../../widgets/api_field.dart';
import '../../../widgets/table.dart';
import '../../../widgets/table_component.dart';
import '../order_screen.dart';

class TrackingOrder extends StatelessWidget {
  const TrackingOrder({Key? key}) : super(key: key);

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
              'Tracking Vận Đơn',
              style: AppTextTheme.headerTitle(AppColor.blue1),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 8, 32, 16),
            child: Text(
              'API tracking vận đơn. Có thể tracking một hoặc nhiều vận đơn (tối đa 30 mã, mỗi mã cách nhau dẩu phẩy).',
              style: AppTextTheme.normalText(AppColor.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ApiField(
              method: 'GET',
              methodColor: Colors.greenAccent,
              link:
                  'https://private-anon-023b4f4949-ntexpress.apiary-mock.com/v1/bill/tracking?bill_code',
              parameterBox: WebTable(
                columnWidthRatio: parameterBoxHeader,
                numberOfRows: 1,
                rowBuilder: (index) => TableRow(
                  children: [
                    tableCellText(title: 'bill_code'),
                    tableCellText(title: 'Mã vận đơn (E009,E08)'),
                    tableCellText(title: 'String'),
                  ],
                ),
              ),
              request: const [
                'curl --include',
                'https://private-anon-023b4f4949-ntexpress.apiary-mock.com/v1/bill/tracking?{bill_code}'
              ],
              statusCode: '200',
              headers: const ['Content-Type:application/json'],
              body: const [
                '{',
                '  "success": true,',
                '  "data": [',
                '    {',
                '      "id": 1,',
                '      "ref_bill": "E05492291", // Mẫ vận đơn đối tác',
                '      "total_fee": "229000.0", // Cước phí',
                '      "weight": "10.00", // Trọng lượng hàng hóa',
                '      "dimension_weight": "10.00", // Trọng lượng quy đổi (nếu có)',
                '      "payment_status": "", // Trạng thái thanh toán',
                '      "bill_status": "Đã Nhận Hàng", // Trạng thái vận đơn',
                '      "date_pickup": "2021-02-22 17:11:32.795", // Thời gian lấy hàng',
                '      "pay_method": "NGTTN", // Hình thức thanh toán',
                '      "service": "Nhanh", // Loại dịch vụ',
                '      "cod_amt": "100000", // Tiên thu hộ',
                '      "clearing_cod": "N", // Cấn trừ COD: N: Không, Y: có',
                '      "date_expected": "20h 01-01-2020", // Thời gian dự kiến giao hàng',
                '      "cargo_content": "Chứng từ", // Loại hàng hóa',
                '      "description": "Hàng tiêu dùng", // Nội dung hàng hóa',
                '      "note": "Ghi chú hàng hóa tiêu dùng", // Ghi chú hàng hóa',
                '      "sender_name": "Phòng công nghệ", // Tên người gửi',
                '      "sender_phone": "0943538904", // Số điện thoại người gửi',
                '      "sender_address": "845 Hoàng Hoa Thám ,Phường 8,Quận Tân Bình,TP. Hồ Chí Minh", // Địa chỉ gửi',
                '      "receiver_name": "Việt Nguyễn Quốc", // Tên người nhận',
                '      "receiver_phone": "0373638358", // Số điện thoại nhận',
                '      "receiver_address": "19 Xuân Diệu,Phường Điện Biên,Quận Ba Đình,Hà Nội", // Địa chỉ nhận',
                '      "histories": [] // Log hanh trinh',
                '    },',
                '    {',
                '      "ref_bill": "E05492293",',
                '      "total_fee": "229000.0", // Cước phí',
                '      "weight": "10.00", // Trọng lượng hàng hóa',
                '      "dimension_weight": "10.00", // Trọng lượng quy đổi (nếu có)',
                '      "payment_status": "", // Trạng thái thanh toán',
                '      "bill_status": "Đã Nhận Hàng", // Trạng thái vận đơn',
                '      "date_pickup": "2021-02-22 17:11:32.795", // Thời gian lấy hàng',
                '      "pay_method": "NGTTN", // Hình thức thanh toán',
                '      "service": "Nhanh", // Loại dịch vụ',
                '      "cod_amt": "100000", // Tiên thu hộ',
                '      "clearing_cod": "N", // Cấn trừ COD: N: Không, Y: có',
                '      "date_expected": "20h 01-01-2020", // Thời gian dự kiến giao hàng',
                '      "cargo_content": "Chứng từ", // Loại hàng hóa',
                '      "description": "Hàng tiêu dùng", // Nội dung hàng hóa',
                '      "note": "Ghi chú hàng hóa tiêu dùng", // Ghi chú hàng hóa',
                '      "sender_name": "Phòng công nghệ", // Tên người gửi',
                '      "sender_phone": "0943538904", // Số điện thoại người gửi',
                '      "sender_address": "845 Hoàng Hoa Thám ,Phường 8,Quận Tân Bình,TP. Hồ Chí Minh", // Địa chỉ gửi',
                '      "receiver_name": "Việt Nguyễn Quốc", // Tên người nhận',
                '      "receiver_phone": "0373638358", // Số điện thoại nhận',
                '      "receiver_address": "19 Xuân Diệu,Phường Điện Biên,Quận Ba Đình,Hà Nội", // Địa chỉ nhận',
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
