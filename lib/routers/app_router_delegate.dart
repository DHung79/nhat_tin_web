import 'package:flutter/material.dart';
import 'package:nhat_tin_web/config/logger/logger.dart';
import 'package:nhat_tin_web/screens/area_screen/area_screen.dart';
import 'package:nhat_tin_web/screens/verification_screen/verification_screen.dart';
import 'package:nhat_tin_web/screens/versions_screen/versions_screen.dart';
import '../screens/webhooks_screen/webhook_screen.dart';
import '/screens/introduction_screen/introduction_screen.dart';
import '/screens/wellcome_screen/wellcome_screen.dart';
import '../screens/unknown_screen/unknown_screen.dart';
import 'navigator_type.dart';
import 'no_animation_transition_delegate.dart';
import 'route_names.dart';
import 'route_path.dart';

class AppRouterDelegate extends RouterDelegate<AppRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRoutePath> {
  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final ValueNotifier<NavigatorType?> _tagNotifier = ValueNotifier(null);

  AppRouterDelegate() {
    Listenable.merge([
      _tagNotifier,
    ]).addListener(() {
      notifyListeners();
    });
  }
  String _routePath = '';

  @override
  AppRoutePath get currentConfiguration {
    final getRoute = routesHasTag.where((e) => _routePath.contains(e));
    if (getRoute.isNotEmpty) {
      final route = getRoute.first;
      _getTagFor(route);
    }

    return AppRoutePath.routeFrom(_routePath);
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      transitionDelegate: NoAnimationTransitionDelegate(),
      pages: [
        _pageFor(_routePath),
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }
        notifyListeners();
        return true;
      },
    );
  }

  _pageFor(String route) {
    return MaterialPage(
      key: const ValueKey('Nhất Tín'),
      child: _screenFor(route),
    );
  }

  _screenFor(String route) {
    if (route.isEmpty || route == initialRoute) {
      return const WellComeScreen();
    }

    if (route.startsWith(introducationRoute)) {
      if (route.length > introducationRoute.length) {
        final tag = route.substring(introducationRoute.length, route.length);
        if (getTagsOfRoute(introducationRoute).contains(tag)) {
          return IntroductionScreen(tagNotifier: _tagNotifier);
        } else {
          return const UnknownScreen();
        }
      }
      return IntroductionScreen(tagNotifier: _tagNotifier);
    }

    if (route.startsWith(versionsRoute)) {
      if (route.length > versionsRoute.length) {
        final tag = route.substring(versionsRoute.length, route.length);
        if (getTagsOfRoute(versionsRoute).contains(tag)) {
          return VersionsScreen(tagNotifier: _tagNotifier);
        } else {
          return const UnknownScreen();
        }
      }
      return VersionsScreen(tagNotifier: _tagNotifier);
    }

    if (route.startsWith(verificationRoute)) {
      if (route.length > verificationRoute.length) {
        final tag = route.substring(verificationRoute.length, route.length);
        if (getTagsOfRoute(verificationRoute).contains(tag)) {
          return VerificationScreen(tagNotifier: _tagNotifier);
        } else {
          return const UnknownScreen();
        }
      }
      return VerificationScreen(tagNotifier: _tagNotifier);
    }

    if (route.startsWith(areaRoute)) {
      if (route.length > areaRoute.length) {
        final tag = route.substring(areaRoute.length, route.length);
        if (getTagsOfRoute(areaRoute).contains(tag)) {
          return AreaScreen(tagNotifier: _tagNotifier);
        } else {
          return const UnknownScreen();
        }
      }
      return AreaScreen(tagNotifier: _tagNotifier);
    }

    if (route.startsWith(orderRoute)) {
      if (route.length > orderRoute.length) {
        final tag = route.substring(orderRoute.length, route.length);
        if (getTagsOfRoute(orderRoute).contains(tag)) {
          return VersionsScreen(tagNotifier: _tagNotifier);
        } else {
          return const UnknownScreen();
        }
      }
      return VersionsScreen(tagNotifier: _tagNotifier);
    }

    if (route == webhooksRoute) {
      return WebhookScreen(tagNotifier: _tagNotifier);
    }
    return const UnknownScreen();
  }

  @override
  Future<void> setNewRoutePath(AppRoutePath configuration) async {
    _routePath = configuration.name ?? pageNotFoundRoute;
  }

  void navigateTo(String name) {
    _routePath = name;
    notifyListeners();
  }

  _getTagFor(String route) {
    if (_routePath.length > route.length) {
      final tag = _routePath.substring(route.length, _routePath.length);
      _tagNotifier.value = NavigatorType(
        tag: getTagsOfRoute(route).contains(tag)
            ? tag
            : getTagsOfRoute(route).first,
        source: NavigatorTypeSelectionSource.fromBrowserAddressBar,
      );
    }
    if (_routePath == route) {
      _tagNotifier.value = NavigatorType(
        tag: getTagsOfRoute(route).first,
        source: NavigatorTypeSelectionSource.fromBrowserAddressBar,
      );
    }
  }

  List<String> getTagsOfRoute(String route) {
    List<String> tags = [];
    if (route == introducationRoute) {
      tags = [
        introductionTag1,
        introductionTag2,
      ];
    }
    if (route == versionsRoute) {
      tags = [
        versionsTag1,
        versionsTag2,
      ];
    }
    if (route == verificationRoute) {
      tags = [
        verificationTag1,
        verificationTag2,
      ];
    }
    if (route == areaRoute) {
      tags = [
        areaTag1,
        areaTag2,
        areaTag3,
      ];
    }
    if (route == orderRoute) {
      tags = [
        orderTag1,
        orderTag2,
        orderTag3,
        orderTag4,
        orderTag5,
        orderTag6,
        orderTag7,
      ];
    }
    return tags;
  }
}
