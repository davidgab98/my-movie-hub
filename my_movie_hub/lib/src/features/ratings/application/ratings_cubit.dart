import 'package:my_movie_hub/src/core/enums/list_display_modes.dart';
import 'package:my_movie_hub/src/core/events/event_bus.dart';
import 'package:my_movie_hub/src/core/events/events.dart';
import 'package:my_movie_hub/src/features/movie_list/application/complex_movie_list/complex_movie_list_cubit.dart';
import 'package:my_movie_hub/src/features/ratings/domain/repositories/ratings_repository.dart';

class RatingsCubit extends ComplexMovieListCubit {
  RatingsCubit({
    required RatingsRepository ratingsRepository,
    required IEventBus eventBus,
  }) : super(
          fetchMovies: ratingsRepository.getRatedMovies,
          initialListDisplayMode: ListDisplayMode.grid2,
        ) {
    eventBus.on<RateMovieEvent>().listen((event) {
      if (event.rate != null) {
        return addMovie(movie: event.movie);
      } else {
        return removeMovie(movieId: event.movie.id);
      }
    });
  }
}
