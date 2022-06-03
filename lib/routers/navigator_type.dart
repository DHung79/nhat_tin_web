import 'package:equatable/equatable.dart';

class NavigatorType extends Equatable {
  final String tag;
  final NavigatorTypeSelectionSource source;

  const NavigatorType({required this.tag, required this.source});

  @override
  List<Object?> get props => [tag, source];
}

enum NavigatorTypeSelectionSource {
  fromScroll,
  fromButtonClick,
  fromBrowserAddressBar
}
