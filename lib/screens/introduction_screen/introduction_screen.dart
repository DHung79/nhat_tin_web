import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nhat_tin_web/routers/route_names.dart';
import 'package:nhat_tin_web/theme/app_colors.dart';

import '../../routers/navigator_type.dart';
import '../layout_template/content_screen.dart';

class IntroductionScreen extends StatefulWidget {
  final ValueListenable<NavigatorType?> tagNotifier;
  const IntroductionScreen({
    Key? key,
    required this.tagNotifier,
  }) : super(key: key);

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      route: introductionRoute,
      child: Container(color: AppColor.white),
      tagNotifier: widget.tagNotifier,
    );
  }
}
