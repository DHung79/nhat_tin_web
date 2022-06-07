import 'package:flutter/material.dart';
import '/theme/app_theme.dart';

class Tag2 extends StatelessWidget {
  final Color? color;
  final String title;
  const Tag2({Key? key, this.color, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.white,
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Row(
              children: [
                _buildBoxColor(
                  backgroundColor: AppColor.black,
                ),
                _buildBoxColor(
                  backgroundColor: AppColor.white,
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                _buildBoxColor(
                  backgroundColor: AppColor.yellow1,
                ),
                _buildBoxColor(
                  backgroundColor: AppColor.yellow2,
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                _buildBoxColor(
                  backgroundColor: AppColor.blue1,
                ),
                _buildBoxColor(
                  backgroundColor: AppColor.blue2,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                _buildBoxColor(
                  backgroundColor: AppColor.blue3,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBoxColor({
    Color? backgroundColor,
  }) {
    final textColors = [
      AppColor.yellow1,
      AppColor.yellow2,
      AppColor.blue1,
      AppColor.blue2,
      AppColor.blue3,
      AppColor.black,
      AppColor.white,
    ];
    return Expanded(
      flex: 1,
      child: Container(
        color: backgroundColor,
        child: Wrap(
          children: [
            for (var textColor in textColors)
              SizedBox(
                width: 200,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Center(
                    child: SelectableText(
                      title,
                      style: TextStyle(
                        fontSize: 30,
                        color: textColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
