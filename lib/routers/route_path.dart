import 'route_names.dart';

class AppRoutePath {
  final String? name;
  final String? routeId;
  final bool isUnknown;

  AppRoutePath.initial()
      : name = initialRoute,
        routeId = '',
        isUnknown = false;
  //authentication
  AppRoutePath.introduction({String? tag})
      : name = tag != null && tag.isNotEmpty
            ? '$introductionRoute$tag'
            : introductionRoute,
        routeId = '',
        isUnknown = false;

  AppRoutePath.area({String? tag})
      : name = tag != null && tag.isNotEmpty ? '$areaRoute$tag' : areaRoute,
        routeId = '',
        isUnknown = false;

  AppRoutePath.unknown()
      : name = null,
        routeId = '',
        isUnknown = true;

  static AppRoutePath routeFrom(
    String? name,
  ) {
    if (name == initialRoute) {
      return AppRoutePath.initial();
    }
    //authentication

    if (name!.startsWith(introductionRoute)) {
      if (name.length > introductionRoute.length) {
        final tag = name.substring(introductionRoute.length, name.length);
        if (tag.isNotEmpty) return AppRoutePath.introduction(tag: tag);
      }
      return AppRoutePath.introduction();
    }

    if (name.startsWith(areaRoute)) {
      if (name.length > areaRoute.length) {
        final tag = name.substring(areaRoute.length, name.length);
        if (tag.isNotEmpty) return AppRoutePath.area(tag: tag);
      }
      return AppRoutePath.area();
    }

    return AppRoutePath.unknown();
  }
}
