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
            ? '$introducationRoute$tag'
            : introducationRoute,
        routeId = '',
        isUnknown = false;

  AppRoutePath.versions({String? tag})
      : name = tag != null && tag.isNotEmpty
            ? '$versionsRoute$tag'
            : versionsRoute,
        routeId = '',
        isUnknown = false;

  AppRoutePath.verification({String? tag})
      : name = tag != null && tag.isNotEmpty
            ? '$verificationRoute$tag'
            : verificationRoute,
        routeId = '',
        isUnknown = false;

  AppRoutePath.area({String? tag})
      : name = tag != null && tag.isNotEmpty ? '$areaRoute$tag' : areaRoute,
        routeId = '',
        isUnknown = false;

  AppRoutePath.order({String? tag})
      : name = tag != null && tag.isNotEmpty ? '$orderRoute$tag' : orderRoute,
        routeId = '',
        isUnknown = false;

  AppRoutePath.webhooks()
      : name = webhooksRoute,
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

    if (name!.startsWith(introducationRoute)) {
      if (name.length > introducationRoute.length) {
        final tag = name.substring(introducationRoute.length, name.length);
        if (tag.isNotEmpty) return AppRoutePath.introduction(tag: tag);
      }
      return AppRoutePath.introduction();
    }

    if (name.startsWith(versionsRoute)) {
      if (name.length > versionsRoute.length) {
        final tag = name.substring(versionsRoute.length, name.length);
        if (tag.isNotEmpty) return AppRoutePath.versions(tag: tag);
      }
      return AppRoutePath.versions();
    }

    if (name.startsWith(verificationRoute)) {
      if (name.length > verificationRoute.length) {
        final tag = name.substring(verificationRoute.length, name.length);
        if (tag.isNotEmpty) return AppRoutePath.verification(tag: tag);
      }
      return AppRoutePath.verification();
    }

    if (name.startsWith(areaRoute)) {
      if (name.length > areaRoute.length) {
        final tag = name.substring(areaRoute.length, name.length);
        if (tag.isNotEmpty) return AppRoutePath.area(tag: tag);
      }
      return AppRoutePath.area();
    }

    if (name.startsWith(orderRoute)) {
      if (name.length > orderRoute.length) {
        final tag = name.substring(orderRoute.length, name.length);
        if (tag.isNotEmpty) return AppRoutePath.order(tag: tag);
      }
      return AppRoutePath.order();
    }

    if (name == webhooksRoute) {
      return AppRoutePath.webhooks();
    }

    return AppRoutePath.unknown();
  }
}
