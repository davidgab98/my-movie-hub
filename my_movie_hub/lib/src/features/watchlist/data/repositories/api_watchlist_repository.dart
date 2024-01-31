import 'package:multiple_result/multiple_result.dart';
import 'package:my_movie_hub/src/core/exceptions/network_exception.dart';
import 'package:my_movie_hub/src/core/network/endpoints.dart';
import 'package:my_movie_hub/src/core/network/network_service.dart';
import 'package:my_movie_hub/src/features/watchlist/application/watchlist_state.dart';
import 'package:my_movie_hub/src/features/watchlist/domain/models/watchlist.dart';
import 'package:my_movie_hub/src/features/watchlist/domain/repositories/watchlist_repository.dart';

class ApiWatchlistRepository extends WatchlistRepository {
  ApiWatchlistRepository({required this.networkService});
  final NetworkService networkService;

  @override
  Future<Result<Watchlist, Exception>> getWatchlist({
    required int page,
    OrderType orderType = OrderType.asc,
  }) async {
    try {
      final response = await networkService.get(
        Endpoints.watchlistMovies,
        queryParameters: {
          'page': page,
          'sort_by': orderType.toApi(),
        },
      );

      final Watchlist result =
          Watchlist.fromJson(response.data as Map<String, Object?>);

      return Success(result);
    } catch (e) {
      return Error(NetworkException.fromError(e));
    }
  }

  @override
  Future<Result<Unit, Exception>> addMovie({
    required int movieId,
  }) async {
    try {
      await networkService.post(
        Endpoints.addRemoveMovieFromWatchlist,
        data: {
          'media_type': 'movie',
          'media_id': movieId,
          'watchlist': true,
        },
      );

      return const Success(unit);
    } catch (e) {
      return Error(NetworkException.fromError(e));
    }
  }

  @override
  Future<Result<Unit, Exception>> removeMovie({
    required int movieId,
  }) async {
    try {
      await networkService.post(
        Endpoints.addRemoveMovieFromWatchlist,
        data: {
          'media_type': 'movie',
          'media_id': movieId,
          'watchlist': false,
        },
      );

      return const Success(unit);
    } catch (e) {
      return Error(NetworkException.fromError(e));
    }
  }
}
