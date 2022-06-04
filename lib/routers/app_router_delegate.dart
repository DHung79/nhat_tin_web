import 'package:flutter/material.dart';
import 'package:nhat_tin_web/screens/introduction_screen/introduction_screen.dart';
import '../home_screen.dart';
import '../home_screen_02.dart';
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
      return HomeScreen2(tagNotifier: _tagNotifier);
    }

    if (route.startsWith(introductionRoute)) {
      if (route.length > introductionRoute.length) {
        final tag = route.substring(introductionRoute.length + 1, route.length);
        if (getTagsOfRoute(introductionRoute).contains(tag)) {
          return IntroductionScreen(tagNotifier: _tagNotifier);
        } else {
          return const UnknownScreen();
        }
      }
      return IntroductionScreen(tagNotifier: _tagNotifier);
    }

    if (route.startsWith(areaRoute)) {
      if (route.length > areaRoute.length) {
        final tag = route.substring(areaRoute.length + 1, route.length);
        if (getTagsOfRoute(areaRoute).contains(tag)) {
          return HomeScreen(tagNotifier: _tagNotifier);
        } else {
          return const UnknownScreen();
        }
      }
      return HomeScreen(tagNotifier: _tagNotifier);
    }
    return const UnknownScreen();
  }

  @override
  Future<void> setNewRoutePath(AppRoutePath configuration) async {
    _routePath = configuration.name!;
  }

  void navigateTo(String name) {
    _routePath = name;
    notifyListeners();
  }

  _getTagFor(String route) {
    if (_routePath == route && _routePath.length > route.length) {
      final tag = route.substring(route.length + 1, _routePath.length);
      _tagNotifier.value = NavigatorType(
        tag: getTagsOfRoute(route).contains(tag) ? tag : '1',
        source: NavigatorTypeSelectionSource.fromBrowserAddressBar,
      );
    }
  }

  getTagsOfRoute(String route) {
    final List<String> tags = [];
    if (route == introductionRoute) {
      for (int i = 1; i <= 2; i++) {
        tags.add(i.toString());
      }
    }
    if (route == versionsRoute) {
      for (int i = 1; i <= 2; i++) {
        tags.add(i.toString());
      }
    }
    if (route == verificationRoute) {
      for (int i = 1; i <= 2; i++) {
        tags.add(i.toString());
      }
    }
    if (route == areaRoute) {
      for (int i = 1; i <= 3; i++) {
        tags.add(i.toString());
      }
    }
    if (route == orderRoute) {
      for (int i = 1; i <= 7; i++) {
        tags.add(i.toString());
      }
    }
    return tags;
  }
}
