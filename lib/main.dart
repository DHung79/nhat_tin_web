import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:oktoast/oktoast.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'config/locator.dart';
import 'config/scroll_behavior.dart';
import 'locales/i18n.dart';
import 'routers/app_route_information_parser.dart';
import 'routers/app_router_delegate.dart';
import 'utils/app_state_notifier.dart';
export 'locales/i18n.dart';
export 'utils/screen_util.dart';
export 'locales/i18n_key.dart';

int notiBadges = 0;
int homeTabIndex = 0;
Future<SharedPreferences> prefs = SharedPreferences.getInstance();
// Page index
int userManagementIndex = 1;
//Page search
String userManagementSearchString = '';
GlobalKey globalKey = GlobalKey();
final introducationScrollController = ItemScrollController();
final versionsScrollController = ItemScrollController();
final verificationScrollController = ItemScrollController();
final areaScrollController = ItemScrollController();
final orderScrollController = ItemScrollController();

navigateTo(String route) async {
  locator<AppRouterDelegate>().navigateTo(route);
}

jumpTo(int index, {required ItemScrollController controller}) {
  controller.jumpTo(index: index);
}

List<String> getTagsOfRoute(String route) {
  return locator<AppRouterDelegate>().getTagsOfRoute(route);
}

final List<Locale> supportedLocales = <Locale>[
  const Locale('vi'),
  const Locale('en'),
];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await loadVersion();
  setupLocator();
  runApp(
    ChangeNotifierProvider<AppStateNotifier>(
      create: (_) => AppStateNotifier(),
      child: const OKToast(
        child: App(),
      ),
    ),
  );
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => AppState();
  static AppState? of(BuildContext context) =>
      context.findAncestorStateOfType<AppState>();
}

class AppState extends State<App> {
  final AppRouteInforParser _routeInfoParser = AppRouteInforParser();
  Locale currentLocale = supportedLocales[0];

  void setLocale(Locale value) {
    setState(() {
      currentLocale = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateNotifier>(
      builder: (context, appState, child) {
        return MaterialApp.router(
          title: 'Nhất Tín Express API Service',
          debugShowCheckedModeBanner: false,
          themeMode: appState.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          routeInformationParser: _routeInfoParser,
          routerDelegate: locator<AppRouterDelegate>(),
          builder: (context, child) => child!,
          scrollBehavior: MyCustomScrollBehavior(),
          localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
            I18n.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: supportedLocales,
          locale: currentLocale,
        );
      },
    );
  }
}

Future<PackageInfo> loadVersion() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  return packageInfo;
}

String? getCurrentRouteName() {
  return locator<AppRouterDelegate>().currentConfiguration.name;
}
