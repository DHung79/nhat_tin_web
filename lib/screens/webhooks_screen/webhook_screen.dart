import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../order_screen/order_screen.dart';
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
      child: SingleChildScrollView(
        controller: _scrollController,
        child: LayoutBuilder(builder: (context, size) {
          final screenSize = MediaQuery.of(context).size;
          final isMedium = screenSize.width < 1200;
          final isMini = screenSize.width < 950;

          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: isMini
                    ? screenSize.width - 48
                    : isMedium
                        ? screenSize.width - 318
                        : 750,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 32, 0, 16),
                      child: SelectableText(
                        'Webhooks',
                        style: AppTextTheme.headerTitle(AppColor.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                      child: SelectableText(
                        ScreenUtil.t(I18nKey.updateOrderToPartner)!,
                        style: AppTextTheme.mediumHeaderTitle(AppColor.black),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: ApiField(
                        method: ApiMethod.post,
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
                            child: SelectableText(
                              ScreenUtil.t(I18nKey.webhooksContent1)!,
                              style: AppTextTheme.normalText(AppColor.black),
                            ),
                          ),
                          SelectableText(
                            ScreenUtil.t(I18nKey.webhooksContent2)!,
                            style: AppTextTheme.normalText(AppColor.black),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4, bottom: 16),
                            child: GestureDetector(
                              child: SelectableText(
                                'https://webdev.ntx.com.vn/huong_dan_su_dung_uat.pdf',
                                style: AppTextTheme.link(AppColor.blue1),
                              ),
                              onTap: () async {
                                const url =
                                    'https://webdev.ntx.com.vn/huong_dan_su_dung_uat.pdf';
                                if (await canLaunchUrl(Uri.parse(url))) {
                                  launchUrl(Uri.parse(url));
                                }
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: WebTable(
                              columnWidthRatio: parameterBoxHeader,
                              numberOfRows: webhooksTable.length,
                              rowBuilder: (index) => rowFor(
                                item: webhooksTable[index],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: BuildListText(
                              titles: [
                                ScreenUtil.t(I18nKey.returnParameters)!,
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
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: _boxContent(
                              titles: [
                                '<strong>weight</strong> (double)         - Trọng lượng hàng hóa <br>',
                                '<strong>dimension_weight</strong> (double) - Trọng lượng quy đổi. Cước sẽ tính theo trong lượng lớn nhất giữa dimension_weight và weight <br>',
                                '<strong>cod_amount</strong> (double)     - Tiền COD <br>',
                              ],
                            ),
                          ),
                          BuildListText(
                            spacing: 8,
                            titles: [
                              ScreenUtil.t(I18nKey.webhooksContent3)!,
                              ScreenUtil.t(I18nKey.webhooksContent4)!,
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 24, 0, 16),
                            child: SelectableText(
                              ScreenUtil.t(I18nKey.orderStatus)!,
                              style:
                                  AppTextTheme.mediumBodyText(AppColor.black),
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
                            padding: const EdgeInsets.fromLTRB(0, 24, 0, 16),
                            child: SelectableText(
                              ScreenUtil.t(I18nKey.listServices)!,
                              style:
                                  AppTextTheme.mediumBodyText(AppColor.black),
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
                            padding: const EdgeInsets.fromLTRB(0, 24, 0, 16),
                            child: SelectableText(
                              ScreenUtil.t(I18nKey.paymentMethods)!,
                              style:
                                  AppTextTheme.mediumBodyText(AppColor.black),
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
                            padding: const EdgeInsets.fromLTRB(0, 24, 0, 16),
                            child: SelectableText(
                              ScreenUtil.t(I18nKey.commoditieType)!,
                              style:
                                  AppTextTheme.mediumBodyText(AppColor.black),
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
          );
        }),
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
              SelectableText(
                text,
                style: AppTextTheme.normalText(AppColor.black),
              ),
          ],
        ),
      ),
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
