import 'package:get_it/get_it.dart';
import './services/navigation.dart';
import './services/api.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  //locator.registerLazySingleton(() => Api());
}
