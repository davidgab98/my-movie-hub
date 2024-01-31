// ignore_for_file: one_member_abstracts
import 'package:multiple_result/multiple_result.dart';
import 'package:my_movie_hub/src/features/watchlist/application/watchlist_state.dart';
import 'package:my_movie_hub/src/features/watchlist/domain/models/watchlist.dart';

abstract class WatchlistRepository {
  Future<Result<Watchlist, Exception>> getWatchlist({
    required int page,
    OrderType orderType = OrderType.asc,
  });
}
