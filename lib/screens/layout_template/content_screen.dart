import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../main.dart';
import '../../routers/navigator_type.dart';
import '../../theme/app_theme.dart';
import 'components/top_navigation_bar.dart';
import 'components/sidebar.dart';

class PageTemplate extends StatefulWidget {
  final Widget child;
  final String route;
  final Widget? wellcome;
  final ValueListenable<NavigatorType?> tagNotifier;

  const PageTemplate({
    Key? key,
    required this.child,
    required this.route,
    this.wellcome,
    required this.tagNotifier,
  }) : super(key: key);

  @override
  State<PageTemplate> createState() => _PageTemplateState();
}

class _PageTemplateState extends State<PageTemplate> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      key: _key,
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, size) {
          return _buildContent();
        },
      ),
    );
  }

  Widget _buildContent() {
    final color = AppColor.blue1;
    return Container(
      color: AppColor.white,
      child: Column(
        children: [
          TopNavigationBar(color: color),
          widget.wellcome ??
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SideBar(
                      color: color,
                      route: widget.route,
                      tagNotifier: widget.tagNotifier,
                    ),
                    Expanded(child: widget.child),
                  ],
                ),
              ),
        ],
      ),
    );
  }
}
