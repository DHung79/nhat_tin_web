import 'package:flutter/material.dart';
import 'route_names.dart';
import 'route_path.dart';

class AppRouteInforParser extends RouteInformationParser<AppRoutePath> {
  @override
  Future<AppRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location!);
    final name = uri.path;

    if (name.isEmpty || name == initialRoute) {
      return AppRoutePath.initial();
    }
    //authentication
    if (name.startsWith(introductionRoute)) {
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

  @override
  RouteInformation restoreRouteInformation(AppRoutePath configuration) {
    if (configuration.isUnknown) {
      return const RouteInformation(location: pageNotFoundRoute);
    }
    return RouteInformation(location: configuration.name);
  }
}
