import 'package:nhat_tin_web/routers/navigator_type.dart';
import 'package:flutter/material.dart';

import 'main.dart';
import 'routers/route_names.dart';

class TagSections extends StatefulWidget {
  final List<String> tags;
  final ValueNotifier<NavigatorType?> tagNotifier;
  final List<Widget> tagContent;
  const TagSections({
    Key? key,
    required this.tags,
    required this.tagNotifier,
    required this.tagContent,
  }) : super(key: key);

  @override
  TagSectionsState createState() => TagSectionsState();
}

class TagSectionsState extends State<TagSections> {
  final double _minPageHeight = 600;

  PageController _pageController = PageController();

  // Find the index of the color code from the colors list
  int get _tagIndex {
    final tag = widget.tagNotifier.value?.tag;
    int index = widget.tags.indexWhere((element) {
      return element == tag;
    });
    return index > -1 ? index : 0;
  }

  @override
  void initState() {
    super.initState();
    widget.tagNotifier.addListener(() {
      final fromScroll = widget.tagNotifier.value?.source ==
          NavigatorTypeSelectionSource.fromScroll;
      if (_pageController.hasClients && !fromScroll) {
        _pageController.animateToPage(
          _tagIndex,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final availableHeight = constraints.maxHeight;
        _updatePageController(availableHeight);
        return NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            if (notification is UserScrollNotification) {
              _onUserScroll();
            }
            return true;
          },
          child: _pageView(),
        );
      },
    );
  }

  PageView _pageView() {
    return PageView.builder(
      pageSnapping: false,
      scrollDirection: Axis.vertical,
      controller: _pageController,
      itemCount: widget.tags.length,
      physics: const AlwaysScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        final tag = widget.tagContent[index];
        return tag;
      },
    );
  }

  void _updatePageController(double availableHeight) {
    if (availableHeight < _minPageHeight) {
      _pageController = PageController(
        viewportFraction: _minPageHeight / availableHeight,
        initialPage: _tagIndex,
      );
    } else {
      _pageController = PageController(
        viewportFraction: 1,
        initialPage: _tagIndex,
      );
    }
  }

  void _onUserScroll() {
    final pageIndex = _pageController.page?.floor() ?? 0;
    final tag = widget.tags[pageIndex];
    navigateTo('$areaRoute/$tag');
    widget.tagNotifier.value = NavigatorType(
      tag: tag,
      source: NavigatorTypeSelectionSource.fromScroll,
    );
  }
}
