import 'package:accelerometer/service/accelerometer_service.dart';
import 'package:accelerometer/service/local_storage_service.dart';
import 'package:accelerometer/service/navigation_service.dart';
import 'package:accelerometer/viewmodel/accelerometer_viewmodel.dart';
import 'package:accelerometer/viewmodel/startup_viewmodel.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton(() => NavigationService());

  var localStorageService = await LocalStorageService.getInstance();
  locator.registerSingleton<LocalStorageService>(localStorageService);
  locator.registerSingleton<AccelerometerService>(AccelerometerService());

  locator.registerFactory(() => StartUpViewModel());
  locator.registerFactory(() => AccelerometerViewModel());
  return null;
}
