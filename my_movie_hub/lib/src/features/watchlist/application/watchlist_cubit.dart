import 'package:my_movie_hub/src/core/events/event_bus.dart';
import 'package:my_movie_hub/src/core/events/events.dart';
import 'package:my_movie_hub/src/features/movie_list/application/movie_list_cubit.dart';
import 'package:my_movie_hub/src/features/watchlist/domain/repositories/watchlist_repository.dart';

class WatchlistCubit extends MovieListCubit {
  WatchlistCubit({
    required WatchlistRepository watchlistRepository,
    required IEventBus eventBus,
  }) : super(fetchMovies: watchlistRepository.getWatchlist) {
    eventBus.on<RemoveMovieFromWatchlistEvent>().listen((event) {
      return removeMovie(movieId: event.movie.id);
    });
    eventBus.on<AddMovieToWatchlistEvent>().listen((event) {
      return addMovie(movie: event.movie);
    });
  }
}
