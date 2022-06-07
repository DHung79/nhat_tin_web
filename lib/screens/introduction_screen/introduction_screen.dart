import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '/routers/route_names.dart';
import '../../main.dart';
import '../../routers/navigator_type.dart';
import '../layout_template/content_screen.dart';
import 'tags/contact_tag.dart';
import 'tags/environment_tag.dart';

class IntroductionScreen extends StatefulWidget {
  final ValueNotifier<NavigatorType?> tagNotifier;

  const IntroductionScreen({
    Key? key,
    required this.tagNotifier,
  }) : super(key: key);

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  final introducationPositionsListener = ItemPositionsListener.create();
  final tags = getTagsOfRoute(introducationRoute);
  double offset = 0;
  final _tag1Key = GlobalKey();
  final _tag2Key = GlobalKey();
  final _viewKey = GlobalKey();
  late Size tag1Size;
  late Size tag2Size;
  late Size viewSize;
  late List<double> tagSize = [];
  getSizeAndPosition() {
    RenderBox? tag1Box =
        _tag1Key.currentContext?.findRenderObject() as RenderBox;
    RenderBox? tag2Box =
        _tag2Key.currentContext?.findRenderObject() as RenderBox;
    RenderBox? viewBox =
        _viewKey.currentContext?.findRenderObject() as RenderBox;
    tag1Size = tag1Box.size;
    tag2Size = tag2Box.size;

    viewSize = viewBox.size;
    tagSize = [
      tag1Size.height,
      tag2Size.height,
    ];
    setState(() {});
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => getSizeAndPosition());
    introducationPositionsListener.itemPositions.addListener(() {
      final currentTagFirst =
          introducationPositionsListener.itemPositions.value.first;
      final currentTagLast =
          introducationPositionsListener.itemPositions.value.last;

      if (offset == currentTagFirst.itemLeadingEdge) {
        if (widget.tagNotifier.value != null) {
          final tagIndex = tags.indexOf(widget.tagNotifier.value!.tag);
          if (tagIndex != currentTagFirst.index) {
            if (tagSize[tagIndex] > viewSize.height) {
              jumpTo(tagIndex, controller: introducationScrollController);
            } else {
              introducationScrollController.scrollTo(
                index: tagIndex,
                duration: const Duration(milliseconds: 150),
              );
            }
          }
        } else {
          if (currentTagFirst.index != 0) {
            navigateTo(introducationRoute + tags[currentTagFirst.index]);
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
            if (tagSize[currentTagLast.index] > viewSize.height) {
              navigateTo(introducationRoute + tags[currentTagLast.index]);
              widget.tagNotifier.value = NavigatorType(
                tag: tags[currentTagLast.index],
                source: NavigatorTypeSelectionSource.fromScroll,
              );
            } else {
              introducationScrollController.scrollTo(
                index: currentTagLast.index,
                duration: const Duration(milliseconds: 150),
              );
            }
          }
        } else {
          if (currentTagFirst.index != 0) {
            navigateTo(introducationRoute + tags[currentTagFirst.index]);
            widget.tagNotifier.value = NavigatorType(
              tag: tags[currentTagFirst.index],
              source: NavigatorTypeSelectionSource.fromScroll,
            );
          }
        }
      } else {
        final tagIndex = tags.indexOf(widget.tagNotifier.value!.tag);
        if (tagIndex > currentTagFirst.index) {
          navigateTo(introducationRoute + tags[currentTagFirst.index]);
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
      route: introducationRoute,
      tagNotifier: widget.tagNotifier,
      child: ScrollablePositionedList.builder(
        key: _viewKey,
        shrinkWrap: true,
        itemScrollController: introducationScrollController,
        itemPositionsListener: introducationPositionsListener,
        physics: const ClampingScrollPhysics(),
        itemCount: tags.length,
        itemBuilder: (context, index) {
          final screenSize = MediaQuery.of(context).size;
          final isMedium = screenSize.width < 1200;
          final isMini = screenSize.width < 950;

          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: isMini
                    ? screenSize.width - 48
                    : isMedium
                        ? screenSize.width - 318
                        : 750,
                child: _buildTag(index),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildTag(int index) {
    if (index == 0) {
      return ContactTag(key: _tag1Key);
    } else {
      return EnvironmentTag(key: _tag2Key);
    }
  }
}
