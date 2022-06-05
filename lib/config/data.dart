class ItemModel {
  final String? text1;
  final String? text2;
  final String? text3;
  final String? text4;
  final List<String>? titles;
  ItemModel({
    this.text1,
    this.text2,
    this.text3,
    this.text4,
    this.titles,
  });
}

final List<ItemModel> orderStatusList = [
  ItemModel(
    text1: '1',
    text2: 'OPN',
    text3: 'Vận đơn mới',
    text4: 'Vận đơn được khởi tạo qua hệ thống NTX',
  ),
  ItemModel(
    text1: '2',
    text2: 'PRI',
    text3: 'Đã xác nhận',
    text4: 'Vận đơn được NTX xác nhận lấy hàng',
  ),
  ItemModel(
    text1: '3',
    text2: 'LPC',
    text3: 'Đã lấy hàng',
    text4: 'Vận đơn đã được Nhân viên NTX lại lấy hàng và xác nhận chốt',
  ),
  ItemModel(
    text1: '4',
    text2: 'EOD',
    text3: 'Đang giao hàng',
    text4: 'Vận đơn được xuất kho trả hàng và bắt đầu giao đến Người nhận',
  ),
  ItemModel(
    text1: '5',
    text2: 'FBC',
    text3: 'Giao thành công',
    text4: 'Vận đơn đã được giao đến Người nhận thành công',
  ),
  ItemModel(
    text1: '6',
    text2: 'GBV',
    text3: 'Hủy',
    text4:
        'Vận đã đã được Hủy từ người gửi hoặc Bộ phận vận hành NTX khi không liên lạc được với Người gửi',
  ),
  ItemModel(
    text1: '7',
    text2: 'MRC',
    text3: 'Đã chuyển hoàn',
    text4:
        'Vận đơn đi giao nhưng không liên hệ hoặc sự cố giao hàng. NTX lập đơn chuyển hoàn và Người nhận hàng hoàn',
  ),
  ItemModel(
    text1: '8',
    text2: 'NRT',
    text3: 'Đang chuyển hoàn',
    text4:
        'Vận đơn đi giao nhưng không liên hệ hoặc sự cố giao hàng. NTX lập đơn chuyển hoàn và bắt đầu hoàn hàng',
  ),
  ItemModel(
    text1: '9',
    text2: 'QIU',
    text3: 'Không giao được',
    text4:
        'Vận đơn khi đang giao hàng không liên hệ được Người nhận hoặc gặp sự cố giao quá 3 lần.',
  ),
  ItemModel(
    text1: '10',
    text2: 'DIT',
    text3: 'Đang luân chuyển',
    text4: 'Vận đơn đang luân chuyển giữa các kho NTX',
  ),
  ItemModel(
    text1: '11',
    text2: 'OEP',
    text3: 'Lỗi lấy hàng',
    text4: 'Vận đơn gặp sự cố lấy hàng quá 3 lần',
  ),
  ItemModel(
    text1: '12',
    text2: 'OEP',
    text3: 'Lỗi lấy hàng',
    text4: 'Vận đơn mới khi Nhân viên NTX xác nhận và đến lấy hàng không được',
  ),
  ItemModel(
    text1: '13',
    text2: 'FUD',
    text3: 'Delay giao hàng',
    text4: 'Vận đơn được giao đến người nhận nhưng gặp sự cố giao.',
  ),
  ItemModel(
    text1: '14',
    text2: 'CIW',
    text3: 'Nhập kho',
    text4: 'Vận đơn đã được lấy và nhập về kho.',
  ),
  ItemModel(
    text1: '15',
    text2: 'WFA',
    text3: 'Chờ duyệt hoàn',
    text4:
        'Vận đơn chờ duyệt hoàn từ khách. Đối với trạng thái này, sau 48h Khách không có thao tác gì, hệ thống sẽ tự động chuyển sang Đã duyệt hoàn',
  ),
  ItemModel(
    text1: '16',
    text2: 'QIU',
    text3: 'Chờ giao lại',
    text4: 'Vận đơn bị sự cố giao, sẽ giao lại trong phiên giao hàng sau',
  ),
  ItemModel(
    text1: '17',
    text2: 'RFA',
    text3: 'Đã duyệt hoàn',
    text4: 'Vận đơn được duyệt hoàn từ khách. Tiền hành lập hoàn',
  ),
  ItemModel(
    text1: '18',
    text2: 'BPU1',
    text3: 'Chờ đóng gói',
    text4: 'Hàng đang còn ở Khách hàng, chờ đóng gói',
  ),
  ItemModel(
    text1: '19',
    text2: 'BPU',
    text3: 'Packed done',
    text4: 'Hàng đã đóng gói và sẳn sàng giao cho nhà vận chuyển',
  ),
];

final List<ItemModel> serviceList = [
  ItemModel(
    text1: '1',
    text2: 'FAST',
  ),
  ItemModel(
    text1: '2',
    text2: 'STANDARD',
  ),
];

final List<ItemModel> payList = [
  ItemModel(
    text1: '10',
    text2: 'NGTTN',
    text3: 'Ngưởi gửi thanh toán ngay',
  ),
  ItemModel(
    text1: '11',
    text2: 'NGTTS',
    text3: 'Ngưởi gửi thanh toán sau',
  ),
  ItemModel(
    text1: '20',
    text2: 'NNTTN',
    text3: 'Ngưởi nhận thanh toán ngay',
  ),
];
final List<ItemModel> contentList = [
  ItemModel(
    text1: '1',
    text2: 'Chứng từ',
  ),
  ItemModel(
    text1: '2',
    text2: 'Hàng tiêu dùng',
  ),
  ItemModel(
    text1: '3',
    text2: 'Thực phẩm',
  ),
  ItemModel(
    text1: '4',
    text2: 'Quà tặng',
  ),
  ItemModel(
    text1: '5',
    text2: 'Hoa',
  ),
  ItemModel(
    text1: '6',
    text2: 'Đồ điện tử',
  ),
  ItemModel(
    text1: '7',
    text2: 'Chất dễ cháy',
  ),
  ItemModel(
    text1: '8',
    text2: 'Khác',
  ),
  ItemModel(
    text1: '9',
    text2: 'Chất lỏng',
  ),
  ItemModel(
    text1: '10',
    text2: 'Mỹ phẩm',
  ),
  ItemModel(
    text1: '11',
    text2: 'Thời trang',
  ),
];

final List<ItemModel> createOrderParameter = [
  ItemModel(
    text1: 'partner_id',
    text2: 'ID Đối tác',
    text3: 'Required - number',
  ),
  ItemModel(
    text1: 's_name',
    text2: 'Tên người gửi',
    text3: 'Required - string',
  ),
  ItemModel(
    text1: 's_phone',
    text2: 'Số điện thoại người gửi',
    text3: 'Required - string',
  ),
  ItemModel(
    text1: 's_address',
    text2:
        'Full address of sender (should be  format: 52A Nguyễn Thái Bình, Phường 4, Quận Tân Bình, Hồ Chí Minh)',
    text3: 'Required - string',
  ),
  ItemModel(
    text1: 's_province_id',
    text2: 'ID Tỉnh Thành người gửi (được lấy từ API Nhất Tín Express)',
    text3: 'Required - number',
  ),
  ItemModel(
    text1: 's_district_id',
    text2: 'ID Quận Huyện người gửi (được lấy từ API Nhất Tín Express)',
    text3: 'Required - number',
  ),
  ItemModel(
    text1: 's_ward_id',
    text2: 'ID Phường Xã người gửi (được lấy từ API Nhất Tín Express)',
    text3: 'Required - number',
  ),
  ItemModel(
    text1: 's_address_value',
    text2:
        'Mã địa chỉ gửi của Người gửi (được hiển thị trong phần thông tin mã địa chỉ của khách hàng)',
    text3: 'String - optional',
  ),
  ItemModel(
    text1: 'return_info',
    titles: [
      'Thông tin về địa chỉ hoàn (nếu hàng được hoàn về khác địa chỉ gửi). Bao gồm các thông tin bên dưới',
      'return_name (required - string) - Thông tin nhận hoàn',
      'return_phone (required - string) - Thông tin số điện thoại hoàn',
      'return_address (required - string) - Thông tin địa chỉ hoàn',
      'return_province_id (required - number) - Thông tin tỉnh nhận hoàn',
      'return_district_id (required - number) - Thông tin quận/huyện nhận hoàn',
      'return_ward_id (required - number) - Thông tin phường/xã nhận hoàn',
    ],
    text3: 'Optional - object',
  ),
  ItemModel(
    text1: 'r_phone',
    text2: 'Số điện thoại người nhận',
    text3: 'String - required',
  ),
  ItemModel(
    text1: 'r_address',
    text2:
        'Full address of receiver (should be  format: 52A Nguyễn Thái Bình, Phường 4, Quận Tân Bình, Hồ Chí Minh)',
    text3: 'String - required',
  ),
  ItemModel(
    text1: 'r_province_id',
    text2: 'ID Tỉnh Thành người nhận (được lấy từ API Nhất Tín Express)',
    text3: 'Required - number',
  ),
  ItemModel(
    text1: 'r_district_id',
    text2: 'ID Quận Huyện người nhận (được lấy từ API Nhất Tín Express)',
    text3: 'Required - number',
  ),
  ItemModel(
    text1: 'r_name',
    text2: 'Tên Phường xã người nhận',
    text3: 'Required - string',
  ),
  ItemModel(
    text1: 'r_ward_id',
    text2: 'ID Phường Xã người nhận(được lấy từ API Nhất Tín Express)',
    text3: 'Required - number',
  ),
  ItemModel(
    text1: 'cod_amount',
    text2: 'Tiền thu hộ',
    text3: 'Double - optional',
  ),
  ItemModel(
    text1: 'service_id',
    text2: 'ID dịch vụ (Phần Mô tả Dịch vụ)',
    text3: 'Required - number',
  ),
  ItemModel(
    text1: 'payment_method',
    text2: 'ID hình thức thanh toán (Phần Mô tả Hình thức thanh toán)',
    text3: 'Required - number',
  ),
  ItemModel(
    text1: 'weight',
    text2: 'Trọng lượng hàng hóa',
    text3: 'Double - required',
  ),
  ItemModel(
    text1: 'package_no',
    text2: 'Số kiện (không truyền mặc định là 1 kiện)',
    text3: 'Optional - integer',
  ),
  ItemModel(
    text1: 'ref_code',
    text2: 'Mã đơn đối tác',
    text3: 'String - optional',
  ),
  ItemModel(
    text1: 'cargo_content_id',
    text2: 'ID danh sách loại hàng hóa (Phần Mô tả hàng hóa)',
    text3: 'Required - number',
  ),
  ItemModel(
    text1: 'cargo_content',
    text2: 'Mô tả thêm nội dung hàng hóa',
    text3: 'String - optional',
  ),
  ItemModel(
    text1: 'cargo_value',
    text2: 'Giá trị hàng hóa',
    text3: 'Double - optional',
  ),
  ItemModel(
    text1: 'length',
    text2: 'Chiều dài gói hàng',
    text3: 'Double - optional',
  ),
  ItemModel(
    text1: 'width',
    text2: 'Chiều rộng gói hàng',
    text3: 'Double - optional',
  ),
  ItemModel(
    text1: 'height',
    text2: 'Chiều cao gói hàng',
    text3: 'Double - optional',
  ),
  ItemModel(
    text1: 'note',
    text2: 'Ghi chú đơn hàng',
    text3: 'String - optional',
  ),
  ItemModel(
    text1: 'is_deduct_cod',
    text2: 'Cấn trừ tiền thu hộ (1: có cấn trừ, 0: không cấn trừ)',
    text3: 'Number - optional - default = 0',
  ),
  ItemModel(
    text1:
        'utm_source (string - required) - Nguồn đối tác tạo vận đơn, theo prefix: API_{ten_doi_tac}',
    text2: '',
    text3: 'String',
  ),
];

final List<ItemModel> createOrderVer2Parameter = [
  ItemModel(
    text1: 'partner_id',
    text2: 'ID of Partner',
    text3: 'Required - number',
  ),
  ItemModel(
    text1: 's_name',
    text2: 'Full name of sender',
    text3: 'Required - string',
  ),
  ItemModel(
    text1: 's_phone',
    text2: 'Phone of sender',
    text3: 'Required - string',
  ),
  ItemModel(
    text1: 's_address',
    text2: 'Address of sender',
    text3: 'Required - string',
  ),
  ItemModel(
    text1: 's_province',
    text2: 'Province name of sender',
    text3: 'Required - string',
  ),
  ItemModel(
    text1: 's_district',
    text2: 'District name of sender',
    text3: 'Required - string',
  ),
  ItemModel(
    text1: 's_ward',
    text2: 'Ward name of sender',
    text3: 'Required - string',
  ),
  ItemModel(
    text1: 'r_name',
    text2: 'Full name of receiver',
    text3: 'String - required',
  ),
  ItemModel(
    text1: 'r_phone',
    text2: 'Phone of receiver',
    text3: 'String - required',
  ),
  ItemModel(
    text1: 'r_address',
    text2: 'Số điện thoại người nhận',
    text3: 'String - required',
  ),
  ItemModel(
    text1: 'r_address',
    text2: 'Address of receiver',
    text3: 'String - required',
  ),
  ItemModel(
    text1: 'r_province',
    text2: 'Province name of receiver',
    text3: 'Required - string',
  ),
  ItemModel(
    text1: 'r_district',
    text2: 'District name of receiver',
    text3: 'Required - string',
  ),
  ItemModel(
    text1: 'r_ward',
    text2: 'Ward name of receiver',
    text3: 'Required - string',
  ),
  ItemModel(
    text1: 'cod_amount',
    text2: 'Amount of COD to collect when package delivered to receiver',
    text3: 'Double - optional',
  ),
  ItemModel(
    text1: 'service',
    text2: 'ID of service (ref to master data information below)',
    text3: 'Required - number',
  ),
  ItemModel(
    text1: 'payment_method',
    text2: 'ID of paymenth method (ref to master data information below)',
    text3: 'Required - number',
  ),
  ItemModel(
    text1: 'weight',
    text2: 'The weight of the package (measured in kg)',
    text3: 'Double - required',
  ),
  ItemModel(
    text1: 'package_no',
    text2: 'The number of package (default : 1)',
    text3: 'Optional - integer',
  ),
  ItemModel(
    text1: 'ref_code',
    text2: 'Reference order code of partner',
    text3: 'String - optional',
  ),
  ItemModel(
    text1: 'cargo_content_id',
    text2: 'ID of cargo content (ref to master data information below)',
    text3: 'Required - number',
  ),
  ItemModel(
    text1: 'cargo_content',
    text2: 'The content of cargo',
    text3: 'String - optional',
  ),
  ItemModel(
    text1: 'cargo_value',
    text2: 'The value of cargo',
    text3: 'Double - optional',
  ),
  ItemModel(
    text1: 'length',
    text2: 'Length of package (measured in cm,Default 0)',
    text3: 'Double - optional',
  ),
  ItemModel(
    text1: 'width',
    text2: 'Width of package (measured in cm,Default 0)',
    text3: 'Double - optional',
  ),
  ItemModel(
    text1: 'height',
    text2: 'Height of package (measured in cm,Default 0)',
    text3: 'Double - optional',
  ),
  ItemModel(
    text1: 'note',
    text2: 'Note of order',
    text3: 'String - optional',
  ),
  ItemModel(
    text1:
        'utm_source (string - required) - Nguồn đối tác tạo vận đơn, theo prefix: API_{ten_doi_tac}',
    text2: '',
    text3: 'String',
  ),
];

final List<ItemModel> pricingAndShippingCostParameter = [
  ItemModel(
    text1: 'partner_id',
    text2: 'Mã ID Khách hàng (nếu có)',
    text3: 'Int - optional',
  ),
  ItemModel(
    text1: 'cod_amount',
    text2: 'Tiền thu hộ',
    text3: 'Double - optional',
  ),
  ItemModel(
    text1: 'cargo_value',
    text2: 'Giá trị hàng hóa',
    text3: 'Double - optional',
  ),
  ItemModel(
    text1: 'weight',
    text2: 'Trọng lượng hàng hóa',
    text3: 'Double - required',
  ),
  ItemModel(
    text1: 'payment_method',
    text2: 'Hình thức thanh toán',
    text3: 'Int - required',
  ),
  ItemModel(
    text1: 's_province_id',
    text2: 'Mã tỉnh thành người gửi (Tham chiếu API Tỉnh thành)',
    text3: 'Int - required',
  ),
  ItemModel(
    text1: 's_district_id',
    text2: 'Mã quận huyền người gửi (Tham chiếu API Quận huyện)',
    text3: 'Int - required',
  ),
  ItemModel(
    text1: 'r_province_id',
    text2: 'Mã tỉnh thành người nhận (Tham chiếu API Tỉnh thành)',
    text3: 'Int - required',
  ),
  ItemModel(
    text1: 'r_district_id',
    text2: 'Mã quận huyền người nhận (Tham chiếu API Quận huyện)',
    text3: 'Int - required',
  ),
];

final List<ItemModel> sendRequestParameter = [
  ItemModel(
    text1: 'partner_id',
    text2: 'Mã ID Khách hàng',
    text3: 'Int - required',
  ),
  ItemModel(
    text1: 'request_type',
    text2:
        'Loại yêu cầu (editCod: Thay đổi tiền COD, editReceiver: Thông tin người nhận, requireCancel: Hủy đơn hàng và hoàn)',
    text3: 'String - required',
  ),
  ItemModel(
    text1: 'do_code',
    text2: 'Mã vận đơn',
    text3: 'Double - optional',
  ),
  ItemModel(
    text1: 'cod_amount',
    text2: 'Tiền COD',
    text3: 'Double - optional',
  ),
  ItemModel(
    text1: 'cargo_value',
    text2: 'Giá trị hàng hóa',
    text3: 'Double - optional',
  ),
  ItemModel(
    text1: 'cargo_content',
    text2: 'Nội dung hàng hóa',
    text3: 'String - optional',
  ),
  ItemModel(
    text1: 'r_address',
    text2: 'Địa chỉ người nhận',
    text3: 'String - optional',
  ),
  ItemModel(
    text1: 'r_name',
    text2: 'Tên người nhận',
    text3: 'String - optional',
  ),
  ItemModel(
    text1: 'r_phone',
    text2: 'Số điện thoại người nhận',
    text3: 'String - optional',
  ),
];
