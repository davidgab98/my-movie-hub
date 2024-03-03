import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:my_movie_hub/src/core/events/event_bus.dart';
import 'package:my_movie_hub/src/core/network/dio_client.dart';
import 'package:my_movie_hub/src/core/network/network_service.dart';
import 'package:my_movie_hub/src/core/storage/local_storage.dart';
import 'package:my_movie_hub/src/core/storage/shared_preferences.dart';
import 'package:my_movie_hub/src/features/favorites/data/repositories/api_favorites_repository.dart';
import 'package:my_movie_hub/src/features/favorites/data/repositories/mock_api_repository.dart';
import 'package:my_movie_hub/src/features/favorites/domain/repositories/favorites_repository.dart';
import 'package:my_movie_hub/src/features/movie/data/repositories/api_movie_repository.dart';
import 'package:my_movie_hub/src/features/movie/data/repositories/mock_movie_repository.dart';
import 'package:my_movie_hub/src/features/movie/domain/repositories/movie_repository.dart';
import 'package:my_movie_hub/src/features/ratings/data/repositories/api_watchlist_repository.dart';
import 'package:my_movie_hub/src/features/ratings/data/repositories/mock_watchlist_repository.dart';
import 'package:my_movie_hub/src/features/ratings/domain/repositories/ratings_repository.dart';
import 'package:my_movie_hub/src/features/sign_in/data/repositories/api_sign_in_repository.dart';
import 'package:my_movie_hub/src/features/sign_in/domain/repositories/sign_in_repository.dart';
import 'package:my_movie_hub/src/features/user/application/user_cubit.dart';
import 'package:my_movie_hub/src/features/watchlist/data/repositories/api_watchlist_repository.dart';
import 'package:my_movie_hub/src/features/watchlist/data/repositories/mock_watchlist_repository.dart';
import 'package:my_movie_hub/src/features/watchlist/domain/repositories/watchlist_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

final locator = GetIt.instance;
const useMocks = false;

Future<void> serviceLocatorSetUp() async {
  locator.registerLazySingletonAsync<SharedPreferences>(
    SharedPreferences.getInstance,
  );
  locator.registerLazySingleton<LocalStorageService>(
    () => SharedPreferencesService(
      preferences: locator<SharedPreferences>(),
    ),
  );

  locator.registerLazySingleton<IEventBus>(
    EventBusFacade.new,
  );

  locator.registerLazySingleton(Dio.new);
  locator.registerLazySingleton<NetworkService>(
    () => DioClient(locator<Dio>()),
  );

  locator.registerLazySingleton<SignInRepository>(
    () => ApiSignInRepository(
      networkService: locator<NetworkService>(),
    ),
  );

  locator.registerLazySingleton<MovieRepository>(
    () => useMocks
        ? MockMovieRepository()
        : ApiMovieRepository(
            networkService: locator<NetworkService>(),
          ),
  );

  locator.registerLazySingleton<WatchlistRepository>(
    () => useMocks
        ? MockWatchlistRepository()
        : ApiWatchlistRepository(
            networkService: locator<NetworkService>(),
          ),
  );

  locator.registerLazySingleton<FavoritesRepository>(
    () => useMocks
        ? MockFavoritesRepository()
        : ApiFavoritesRepository(
            networkService: locator<NetworkService>(),
          ),
  );

  locator.registerLazySingleton<RatingsRepository>(
    () => useMocks
        ? MockRatingsRepository()
        : ApiRatingsRepository(
            networkService: locator<NetworkService>(),
          ),
  );

  registerCubits();
}

void registerCubits() {
  locator.registerLazySingleton<UserCubit>(
    UserCubit.new,
  );
}
