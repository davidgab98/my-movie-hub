import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:my_movie_hub/src/core/network/dio_client.dart';
import 'package:my_movie_hub/src/core/network/network_service.dart';
import 'package:my_movie_hub/src/core/storage/local_storage.dart';
import 'package:my_movie_hub/src/core/storage/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

final locator = GetIt.instance;
const useMocks = true;

Future<void> serviceLocatorSetUp() async {
  locator.registerLazySingletonAsync<SharedPreferences>(
    SharedPreferences.getInstance,
  );
  locator.registerLazySingleton<LocalStorageService>(
    () => SharedPreferencesService(
      preferences: locator<SharedPreferences>(),
    ),
  );

  locator.registerLazySingleton(Dio.new);
  locator.registerLazySingleton<NetworkService>(
    () => DioClient(locator<Dio>()),
  );

  registerCubits();
}

void registerCubits() {}
