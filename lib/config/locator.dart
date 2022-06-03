import 'package:get_it/get_it.dart';
import '../routers/app_router_delegate.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AppRouterDelegate());
}
