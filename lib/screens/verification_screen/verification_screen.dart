import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../../theme/app_theme.dart';
import '/routers/route_names.dart';
import '../../main.dart';
import '../../routers/navigator_type.dart';
import '../layout_template/content_screen.dart';
import 'tags/personal_access_tokens.dart';
import 'tags/password_grant_tokens.dart';

class VerificationScreen extends StatefulWidget {
  final ValueNotifier<NavigatorType?> tagNotifier;

  const VerificationScreen({
    Key? key,
    required this.tagNotifier,
  }) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final verificationPositionsListener = ItemPositionsListener.create();
  final tags = getTagsOfRoute(verificationRoute);
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
    verificationPositionsListener.itemPositions.addListener(() {
      final currentTagFirst =
          verificationPositionsListener.itemPositions.value.first;
      final currentTagLast =
          verificationPositionsListener.itemPositions.value.last;

      if (offset == currentTagFirst.itemLeadingEdge) {
        if (widget.tagNotifier.value != null) {
          final tagIndex = tags.indexOf(widget.tagNotifier.value!.tag);
          if (tagIndex != currentTagFirst.index) {
            if (tagSize[tagIndex] > viewSize.height) {
              jumpTo(tagIndex, controller: verificationScrollController);
            } else {
              verificationScrollController.scrollTo(
                index: tagIndex,
                duration: const Duration(milliseconds: 150),
              );
            }
          }
        } else {
          if (currentTagFirst.index != 0) {
            navigateTo(verificationRoute + tags[currentTagFirst.index]);
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
              navigateTo(verificationRoute + tags[currentTagLast.index]);
              widget.tagNotifier.value = NavigatorType(
                tag: tags[currentTagLast.index],
                source: NavigatorTypeSelectionSource.fromScroll,
              );
            } else {
              verificationScrollController.scrollTo(
                index: currentTagLast.index,
                duration: const Duration(milliseconds: 150),
              );
            }
          }
        } else {
          if (currentTagFirst.index != 0) {
            navigateTo(verificationRoute + tags[currentTagFirst.index]);
            widget.tagNotifier.value = NavigatorType(
              tag: tags[currentTagFirst.index],
              source: NavigatorTypeSelectionSource.fromScroll,
            );
          }
        }
      } else {
        final tagIndex = tags.indexOf(widget.tagNotifier.value!.tag);
        if (tagIndex > currentTagFirst.index) {
          navigateTo(verificationRoute + tags[currentTagFirst.index]);
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
      route: verificationRoute,
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
              itemScrollController: verificationScrollController,
              itemPositionsListener: verificationPositionsListener,
              physics: const ClampingScrollPhysics(),
              itemCount: tags.length,
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: max(MediaQuery.of(context).size.width * 0.4, 750),
                        child: _buildTag(index)),
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
      return PasswordGrantTokens(key: _tag1Key);
    } else {
      return PersonalAccessTokens(key: _tag2Key);
    }
  }
}
