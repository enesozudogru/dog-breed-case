import 'package:get_it/get_it.dart';
import '../../feature/services/breed_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => BreedService());
}
