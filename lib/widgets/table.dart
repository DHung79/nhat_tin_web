import 'package:flutter/material.dart';
import 'package:nhat_tin_web/widgets/api_field.dart';
import '../theme/app_theme.dart';
import 'dynamic_table.dart';
import 'table_component.dart';

class WebTable extends StatelessWidget {
  final List<TableHeader> columnWidthRatio;
  final int numberOfRows;
  final ApiMethod? apiMethod;
  final TableRow Function(int) rowBuilder;
  const WebTable({
    Key? key,
    required this.columnWidthRatio,
    required this.numberOfRows,
    required this.rowBuilder,
    this.apiMethod,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color headerColor = AppColor.blue3;
    if (apiMethod != null) {
      headerColor = methodColor[apiMethod!.index];
    }
    return DynamicTable(
      tableBorder: Border.all(
        color: AppColor.black.withOpacity(0.1),
      ),
      hasBodyData: true,
      headerColor: headerColor,
      headerStyle: TextStyle(
        color: AppColor.white,
        fontWeight: FontWeight.w500,
      ),
      headerBorder: TableBorder(
        verticalInside: BorderSide(
          color: AppColor.black.withOpacity(0.1),
        ),
      ),
      columnWidthRatio: columnWidthRatio,
      numberOfRows: numberOfRows,
      rowBuilder: rowBuilder,
    );
  }
}
