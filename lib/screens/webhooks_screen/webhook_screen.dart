import 'package:flutter/material.dart';
import '/widgets/api_field.dart';
import '/widgets/list_text.dart';
import '../../config/data.dart';
import '../../main.dart';
import '../../theme/app_theme.dart';
import '../../widgets/table.dart';
import '../../widgets/table_component.dart';
import '/routers/route_names.dart';
import '../../routers/navigator_type.dart';
import '../layout_template/content_screen.dart';

class WebhookScreen extends StatefulWidget {
  final ValueNotifier<NavigatorType?> tagNotifier;

  const WebhookScreen({
    Key? key,
    required this.tagNotifier,
  }) : super(key: key);

  @override
  State<WebhookScreen> createState() => _WebhookScreenState();
}

class _WebhookScreenState extends State<WebhookScreen> {
  final _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return PageTemplate(
      route: webhooksRoute,
      tagNotifier: widget.tagNotifier,
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.yellow2,
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Container(
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  blurRadius: 24,
                  color: AppColor.blue1.withOpacity(0.2),
                )
              ],
            ),
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: max(MediaQuery.of(context).size.width * 0.4, 750),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 32, 0, 16),
                          child: Text(
                            'Webhooks',
                            style: AppTextTheme.headerTitle(AppColor.black),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                          child: Text(
                            'Cập nhật vận đơn sang đối tác',
                            style:
                                AppTextTheme.mediumHeaderTitle(AppColor.black),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: ApiField(
                            method: 'POST',
                            link:
                                'https://private-anon-023b4f4949-ntexpress.apiary-mock.com/v1/webhook',
                            request: [
                              'curl --include',
                              '     --request POST ',
                              '     --header "Content-Type: application/json" ',
                              '     --data-binary " {',
                              '"bill_no": "E99999999",',
                              '"ref_code": "DH098989898",',
                              '"status_id": 5,',
                              '"status_name": "Giao thành công",',
                              '"status_time": 190009099090,',
                              '"shipping_fee": 50000,',
                              '"reason": "",',
                              '"weight": 3.4',
                              '}"',
                              'https://private-anon-023b4f4949-ntexpress.apiary-mock.com/v1/webhook',
                            ],
                            statusCode: '200',
                            headers: ['Content-Type:application/json'],
                            body: [
                              '{',
                              '"success": true,',
                              '"data": [],',
                              '"message": "Received"',
                              '}',
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 8, 0, 16),
                                child: Text(
                                  'Ngay khi đơn hàng có cập nhật mới, hệ thống NTX sẽ tự động gửi cập nhật sang hệ thống của đối tác thông qua một URL(callback link) mà đối tác gửi cho kỹ thuật NTX. Tham khảo thêm bảng mã trạng thái đơn hàng.',
                                  style:
                                      AppTextTheme.normalText(AppColor.black),
                                ),
                              ),
                              Text(
                                'Ví dụ, API callback của đối tác là: https://apidoitac.sampmle.com/update-shipping. Các tham số mà NTX truyền vào body sang đối tác. Tài liệu hướng dẫn đối tác tự thao tác chuyển đổi trạng thái vận đơn để tự động gọi về webhook:',
                                style: AppTextTheme.normalText(AppColor.black),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text(
                                  'https://webdev.ntx.com.vn/huong_dan_su_dung_uat.pdf',
                                  style: AppTextTheme.link(AppColor.black),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Wrap(
                                  runSpacing: 6,
                                  children: [
                                    _buildTextRow(
                                      title: 'bill_no',
                                      subTitle:
                                          '(string) - Mã vận đơn vận chuyển NTX',
                                    ),
                                    _buildTextRow(
                                      title: 'ref_code',
                                      subTitle:
                                          '(string) - Mã đơn hàng đối tác',
                                    ),
                                    _buildTextRow(
                                      title: 'status_id ',
                                      subTitle:
                                          '(int) - ID trạng thái. Được mô tả trong bộ mô tả trạng thái trong mục này',
                                    ),
                                    _buildTextRow(
                                      title: 'status_name',
                                      subTitle:
                                          '(string) - Tên trạng thái. Được mô tả trong bộ mô tả trạng thái trong mục này',
                                    ),
                                    _buildTextRow(
                                      title: 'status_time',
                                      subTitle:
                                          '(int) - Thời gian xảy ra bước trạng thái',
                                    ),
                                    _buildTextRow(
                                      title: 'shipping_fee',
                                      subTitle:
                                          '(double) - Tổng cước và các loại phí vận chuyển',
                                    ),
                                    _buildTextRow(
                                      title: 'list_issue',
                                      subTitle:
                                          '(array) - Nguyên nhân lý do sự cố lấy hàng - trả hàng',
                                    ),
                                  ],
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 8.0),
                                child: BuildListText(
                                  titles: [
                                    'Các thông số trong mảng trả về',
                                    'do_code: Mã vận đơn',
                                    'report_type: Loại sự cố (1: Lấy hàng, 2: Trả hàng)',
                                    'report_type_name: Tên loại sự cố tương ứng',
                                    'report_emp: Mã nhân viên báo sự cố',
                                    'reason: Lý do sự cố',
                                    'created_at: Ngày báo sự cố',
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                child: _boxContent(
                                  titles: [
                                    '<strong>weight</strong> (double)         - Trọng lượng hàng hóa <br>',
                                    '<strong>dimension_weight</strong> (double) - Trọng lượng quy đổi. Cước sẽ tính theo trong lượng lớn nhất giữa dimension_weight và weight <br>',
                                    '<strong>cod_amount</strong> (double)     - Tiền COD <br>',
                                  ],
                                ),
                              ),
                              const BuildListText(
                                spacing: 8,
                                titles: [
                                  'Giả sử đơn hàng mã đơn hàng của khách là “DH098989898” (mã vận đơn là “E99999999”) được cập nhật “"giao thành công”.',
                                  'Data NTX sẽ gửi tới callback link của đối tác theo nội dung request',
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 24, 0, 16),
                                child: Text(
                                  'Bộ trạng thái đơn hàng',
                                  style: AppTextTheme.mediumBodyText(
                                      AppColor.black),
                                ),
                              ),
                              WebTable(
                                columnWidthRatio: orderStatusHeader,
                                numberOfRows: orderStatusList.length,
                                rowBuilder: (index) => _rowFor(
                                  item: orderStatusList[index],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 24, 0, 16),
                                child: Text(
                                  'Danh sách dịch vụ',
                                  style: AppTextTheme.mediumBodyText(
                                      AppColor.black),
                                ),
                              ),
                              WebTable(
                                columnWidthRatio: serviceHeader,
                                numberOfRows: serviceList.length,
                                rowBuilder: (index) => _rowFor(
                                  item: serviceList[index],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 24, 0, 16),
                                child: Text(
                                  'Hình thức thanh toán',
                                  style: AppTextTheme.mediumBodyText(
                                      AppColor.black),
                                ),
                              ),
                              WebTable(
                                columnWidthRatio: payHeader,
                                numberOfRows: payList.length,
                                rowBuilder: (index) => _rowFor(
                                  item: payList[index],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 24, 0, 16),
                                child: Text(
                                  'Danh sách nội dung hàng hóa',
                                  style: AppTextTheme.mediumBodyText(
                                      AppColor.black),
                                ),
                              ),
                              WebTable(
                                columnWidthRatio: serviceHeader,
                                numberOfRows: contentList.length,
                                rowBuilder: (index) => _rowFor(
                                  item: contentList[index],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _boxContent({required List<String> titles}) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.black.withOpacity(0.1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          runSpacing: 4,
          children: [
            for (var text in titles)
              Text(
                text,
                style: AppTextTheme.normalText(AppColor.black),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextRow({
    required String title,
    required String subTitle,
  }) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 4),
          child: Text(
            title,
            style: AppTextTheme.normalText(AppColor.black).copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          subTitle,
          style: AppTextTheme.normalText(AppColor.black),
        ),
      ],
    );
  }

  TableRow _rowFor({required ItemModel item}) {
    return TableRow(
      children: [
        tableCellText(title: item.text1),
        tableCellText(title: item.text2),
        if (item.text3 != null) tableCellText(title: item.text3),
        if (item.text4 != null) tableCellText(title: item.text4),
      ],
    );
  }

  final List<TableHeader> orderStatusHeader = [
    TableHeader(
      title: 'ID',
      width: 60,
      isConstant: true,
    ),
    TableHeader(
      title: ScreenUtil.t(I18nKey.statusId)!,
      width: 120,
      isConstant: true,
    ),
    TableHeader(
      title: ScreenUtil.t(I18nKey.statusName)!,
      width: 180,
      isConstant: true,
    ),
    TableHeader(
      title: ScreenUtil.t(I18nKey.description)!,
      width: 300,
    ),
  ];

  final List<TableHeader> serviceHeader = [
    TableHeader(
      title: 'ID',
      width: 60,
    ),
    TableHeader(
      title: ScreenUtil.t(I18nKey.description)!,
      width: 200,
    ),
  ];

  final List<TableHeader> payHeader = [
    TableHeader(
      title: 'ID',
      width: 60,
      isConstant: true,
    ),
    TableHeader(
      title: 'Code',
      width: 100,
      isConstant: true,
    ),
    TableHeader(
      title: ScreenUtil.t(I18nKey.description)!,
      width: 200,
    ),
  ];
}
