import 'package:flutter/material.dart';
import '../../main.dart';
import '../../theme/app_theme.dart';
import 'components/top_navigation_bar.dart';
import 'components/sidebar.dart';

class PageTemplate extends StatefulWidget {
  final Widget child;
  final String route;

  const PageTemplate({
    Key? key,
    required this.child,
    required this.route,
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
    return Container(
      color: AppColor.shade1,
      child: Column(
        children: [
          const TopNavigationBar(),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SideBar(
                  route: widget.route,
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
