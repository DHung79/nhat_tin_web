import 'package:flutter/material.dart';
import 'route_names.dart';
import 'route_path.dart';

class AppRouteInforParser extends RouteInformationParser<AppRoutePath> {
  @override
  Future<AppRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location!);
    final name = uri.path;

    if (name == initialRoute) {
      return AppRoutePath.initial();
    }
    //authentication
    if (name.startsWith(introducationRoute)) {
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

  @override
  RouteInformation restoreRouteInformation(AppRoutePath configuration) {
    if (configuration.isUnknown) {
      return const RouteInformation(location: pageNotFoundRoute);
    }
    return RouteInformation(location: configuration.name);
  }
}
