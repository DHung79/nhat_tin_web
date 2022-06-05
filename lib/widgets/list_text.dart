import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class BuildListText extends StatelessWidget {
  final List<String> titles;
  final double spacing;
  final Color? color;
  const BuildListText({
    Key? key,
    required this.titles,
    this.spacing = 4,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var text in titles)
          Padding(
            padding: EdgeInsets.symmetric(vertical: spacing),
            child: Text(
              text,
              style: AppTextTheme.normalText(color ?? AppColor.black),
            ),
          ),
      ],
    );
  }
}
