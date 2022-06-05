import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../../theme/app_theme.dart';
import '/routers/route_names.dart';
import '../../main.dart';
import '../../routers/navigator_type.dart';
import '../layout_template/content_screen.dart';
import 'tags/provinces_tag.dart';
import 'tags/districts_tag.dart';
import 'tags/wards_tag.dart';

class AreaScreen extends StatefulWidget {
  final ValueNotifier<NavigatorType?> tagNotifier;

  const AreaScreen({
    Key? key,
    required this.tagNotifier,
  }) : super(key: key);

  @override
  State<AreaScreen> createState() => _AreaScreenState();
}

class _AreaScreenState extends State<AreaScreen> {
  final areaPositionsListener = ItemPositionsListener.create();
  final tags = getTagsOfRoute(areaRoute);
  double offset = 0;
  final _tag1Key = GlobalKey();
  final _tag2Key = GlobalKey();
  final _tag3Key = GlobalKey();
  final _viewKey = GlobalKey();
  late Size tag1Size;
  late Size tag2Size;
  late Size tag3Size;
  late Size viewSize;
  late List<double> tagSize = [];
  getSizeAndPosition() {
    RenderBox? tag1Box =
        _tag1Key.currentContext?.findRenderObject() as RenderBox;
    RenderBox? tag2Box =
        _tag2Key.currentContext?.findRenderObject() as RenderBox;
    RenderBox? tag3Box =
        _tag3Key.currentContext?.findRenderObject() as RenderBox;
    RenderBox? viewBox =
        _viewKey.currentContext?.findRenderObject() as RenderBox;
    tag1Size = tag1Box.size;
    tag2Size = tag2Box.size;
    tag3Size = tag3Box.size;
    viewSize = viewBox.size;
    tagSize = [
      tag1Size.height,
      tag2Size.height,
      tag3Size.height,
    ];
    setState(() {});
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => getSizeAndPosition());
    areaPositionsListener.itemPositions.addListener(() {
      final currentTagFirst = areaPositionsListener.itemPositions.value.first;
      final currentTagLast = areaPositionsListener.itemPositions.value.last;

      if (offset == currentTagFirst.itemLeadingEdge) {
        if (widget.tagNotifier.value != null) {
          final tagIndex = tags.indexOf(widget.tagNotifier.value!.tag);
          if (tagIndex != currentTagFirst.index) {
            if (tagSize[tagIndex] > viewSize.height) {
              jumpTo(tagIndex, controller: areaScrollController);
            } else {
              areaScrollController.scrollTo(
                index: tagIndex,
                duration: const Duration(milliseconds: 150),
              );
            }
          }
        } else {
          if (currentTagFirst.index != 0) {
            navigateTo(areaRoute + tags[currentTagFirst.index]);
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
              navigateTo(areaRoute + tags[currentTagLast.index]);
              widget.tagNotifier.value = NavigatorType(
                tag: tags[currentTagLast.index],
                source: NavigatorTypeSelectionSource.fromScroll,
              );
            } else {
              areaScrollController.scrollTo(
                index: currentTagLast.index,
                duration: const Duration(milliseconds: 150),
              );
            }
          }
        } else {
          if (currentTagFirst.index != 0) {
            navigateTo(areaRoute + tags[currentTagFirst.index]);
            widget.tagNotifier.value = NavigatorType(
              tag: tags[currentTagFirst.index],
              source: NavigatorTypeSelectionSource.fromScroll,
            );
          }
        }
      } else {
        final tagIndex = tags.indexOf(widget.tagNotifier.value!.tag);
        if (tagIndex > currentTagFirst.index) {
          navigateTo(areaRoute + tags[currentTagFirst.index]);
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
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      route: areaRoute,
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
              itemScrollController: areaScrollController,
              itemPositionsListener: areaPositionsListener,
              physics: const ClampingScrollPhysics(),
              itemCount: tags.length,
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: _buildTag(index),
                    ),
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
      return ProvincesTag(
        key: _tag1Key,
      );
    } else if (index == 1) {
      return DistrictsTag(
        key: _tag2Key,
      );
    } else {
      return WardsTag(
        key: _tag3Key,
      );
    }
  }
}
