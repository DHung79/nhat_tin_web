import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../../config/data.dart';
import '../../theme/app_theme.dart';
import '../../widgets/list_text.dart';
import '../../widgets/table_component.dart';
import '/routers/route_names.dart';
import '../../main.dart';
import '../../routers/navigator_type.dart';
import '../layout_template/content_screen.dart';
import 'tags/cancel_order.dart';
import 'tags/create_order.dart';
import 'tags/create_order_ver2.dart';
import 'tags/pricing_and_shipping_cost.dart';
import 'tags/print_order.dart';
import 'tags/send_request.dart';
import 'tags/tracking_order.dart';

class OrderScreen extends StatefulWidget {
  final ValueNotifier<NavigatorType?> tagNotifier;

  const OrderScreen({
    Key? key,
    required this.tagNotifier,
  }) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final orderPositionsListener = ItemPositionsListener.create();
  final tags = getTagsOfRoute(orderRoute);
  double offset = 0;
  final _tag1Key = GlobalKey();
  final _tag2Key = GlobalKey();
  final _tag3Key = GlobalKey();
  final _tag4Key = GlobalKey();
  final _tag5Key = GlobalKey();
  final _tag6Key = GlobalKey();
  final _tag7Key = GlobalKey();
  final _viewKey = GlobalKey();
  late Size tag1Size;
  late Size tag2Size;
  late Size tag3Size;
  late Size tag4Size;
  late Size tag5Size;
  late Size tag6Size;
  late Size tag7Size;
  late Size viewSize;

  getSizeAndPosition() {
    if (_tag1Key.currentContext != null) {
      RenderBox? tag1Box =
          _tag1Key.currentContext?.findRenderObject() as RenderBox;
      tag1Size = tag1Box.size;
    }
    if (_tag2Key.currentContext != null) {
      RenderBox? tag2Box =
          _tag2Key.currentContext?.findRenderObject() as RenderBox;
      tag2Size = tag2Box.size;
    }
    if (_tag3Key.currentContext != null) {
      RenderBox? tag3Box =
          _tag3Key.currentContext?.findRenderObject() as RenderBox;
      tag1Size = tag3Box.size;
    }
    if (_tag4Key.currentContext != null) {
      RenderBox? tag4Box =
          _tag4Key.currentContext?.findRenderObject() as RenderBox;
      tag4Size = tag4Box.size;
    }
    if (_tag5Key.currentContext != null) {
      RenderBox? tag5Box =
          _tag5Key.currentContext?.findRenderObject() as RenderBox;
      tag5Size = tag5Box.size;
    }
    if (_tag6Key.currentContext != null) {
      RenderBox? tag6Box =
          _tag6Key.currentContext?.findRenderObject() as RenderBox;
      tag6Size = tag6Box.size;
    }
    if (_tag7Key.currentContext != null) {
      RenderBox? tag7Box =
          _tag7Key.currentContext?.findRenderObject() as RenderBox;
      tag7Size = tag7Box.size;
    }

    RenderBox? viewBox =
        _viewKey.currentContext?.findRenderObject() as RenderBox;

    viewSize = viewBox.size;

    setState(() {});
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => getSizeAndPosition());
    orderPositionsListener.itemPositions.addListener(() {
      final currentTagFirst = orderPositionsListener.itemPositions.value.first;
      final currentTagLast = orderPositionsListener.itemPositions.value.last;
      if (offset == currentTagFirst.itemLeadingEdge) {
        if (widget.tagNotifier.value != null) {
          final tagIndex = tags.indexOf(widget.tagNotifier.value!.tag);
          if (tagIndex != currentTagFirst.index) {
            jumpTo(tagIndex, controller: orderScrollController);
          }
        } else {
          if (currentTagFirst.index != 0) {
            navigateTo(orderRoute + tags[currentTagFirst.index]);
            widget.tagNotifier.value = NavigatorType(
              tag: tags[currentTagFirst.index],
              source: NavigatorTypeSelectionSource.fromScroll,
            );
          }
        }
      } else if (offset > currentTagFirst.itemLeadingEdge) {
        if (widget.tagNotifier.value != null) {
          final tagIndex = tags.indexOf(widget.tagNotifier.value!.tag);
          if (tagIndex < currentTagLast.index) {
            navigateTo(orderRoute + tags[currentTagLast.index]);
            widget.tagNotifier.value = NavigatorType(
              tag: tags[currentTagLast.index],
              source: NavigatorTypeSelectionSource.fromScroll,
            );
          }
        } else {
          if (currentTagFirst.index != 0) {
            navigateTo(orderRoute + tags[currentTagFirst.index]);
            widget.tagNotifier.value = NavigatorType(
              tag: tags[currentTagFirst.index],
              source: NavigatorTypeSelectionSource.fromScroll,
            );
          }
        }
      } else {
        final tagIndex = tags.indexOf(widget.tagNotifier.value!.tag);
        if (tagIndex > currentTagFirst.index) {
          navigateTo(orderRoute + tags[currentTagFirst.index]);
          widget.tagNotifier.value = NavigatorType(
            tag: tags[currentTagFirst.index],
            source: NavigatorTypeSelectionSource.fromScroll,
          );
        }
      }
      offset = currentTagFirst.itemLeadingEdge;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      route: orderRoute,
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
            child: ScrollablePositionedList.builder(
              key: _viewKey,
              shrinkWrap: true,
              itemScrollController: orderScrollController,
              itemPositionsListener: orderPositionsListener,
              physics: const ClampingScrollPhysics(),
              itemCount: tags.length,
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: max(MediaQuery.of(context).size.width * 0.4, 750),
                        child: _buildTag(index)),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTag(int index) {
    if (index == 0) {
      return PrintOrder(key: _tag1Key);
    } else if (index == 1) {
      return CreateOrder(key: _tag2Key);
    } else if (index == 2) {
      return CreateOrderVer2(key: _tag3Key);
    } else if (index == 3) {
      return TrackingOrder(key: _tag4Key);
    } else if (index == 4) {
      return PricingAndShippingCost(key: _tag5Key);
    } else if (index == 5) {
      return CancelOrder(key: _tag6Key);
    } else {
      return SendRequest(key: _tag7Key);
    }
  }
}

List<TableHeader> parameterBoxHeader = [
  TableHeader(
    title: 'keyName',
    width: 120,
    isConstant: true,
  ),
  TableHeader(
    title: ScreenUtil.t(I18nKey.description)!,
    width: 300,
  ),
  TableHeader(
    title: 'dataType',
    width: 200,
    isConstant: true,
  ),
];

TableRow rowFor({required ItemModel item}) {
  return TableRow(
    children: [
      tableCellText(title: item.text1),
      item.titles != null
          ? BuildListText(
              titles: item.titles!,
            )
          : tableCellText(title: item.text2),
      tableCellText(title: item.text3),
    ],
  );
}
