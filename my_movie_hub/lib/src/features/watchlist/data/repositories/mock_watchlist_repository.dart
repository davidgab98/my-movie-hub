import 'package:multiple_result/multiple_result.dart';
import 'package:my_movie_hub/src/core/exceptions/network_exception.dart';
import 'package:my_movie_hub/src/features/watchlist/application/watchlist_state.dart';
import 'package:my_movie_hub/src/features/watchlist/domain/models/watchlist.dart';
import 'package:my_movie_hub/src/features/watchlist/domain/repositories/watchlist_repository.dart';

class MockWatchlistRepository extends WatchlistRepository {
  MockWatchlistRepository();

  @override
  Future<Result<Watchlist, Exception>> getWatchlist({
    required int page,
    OrderType orderType = OrderType.asc,
  }) async {
    try {
      await Future<void>.delayed(const Duration(seconds: 2));

      return const Success(Watchlist());
    } catch (e) {
      return Error(NetworkException.fromError(e));
    }
  }
}
