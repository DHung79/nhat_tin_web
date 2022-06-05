import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'dynamic_table.dart';
import 'table_component.dart';

class WebTable extends StatelessWidget {
  final List<TableHeader> columnWidthRatio;
  final int numberOfRows;
  final TableRow Function(int) rowBuilder;
  const WebTable({
    Key? key,
    required this.columnWidthRatio,
    required this.numberOfRows,
    required this.rowBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DynamicTable(
      tableBorder: Border.all(
        color: AppColor.black.withOpacity(0.1),
      ),
      hasBodyData: true,
      headerColor: AppColor.blue1,
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
