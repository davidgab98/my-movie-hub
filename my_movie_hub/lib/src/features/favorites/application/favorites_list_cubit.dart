import 'package:my_movie_hub/src/core/enums/list_display_modes.dart';
import 'package:my_movie_hub/src/core/events/event_bus.dart';
import 'package:my_movie_hub/src/core/events/events.dart';
import 'package:my_movie_hub/src/features/favorites/domain/repositories/favorites_repository.dart';
import 'package:my_movie_hub/src/features/movie_list/application/complex_movie_list/complex_movie_list_cubit.dart';

class FavoriteListCubit extends ComplexMovieListCubit {
  FavoriteListCubit({
    required FavoritesRepository favoritesRepository,
    required IEventBus eventBus,
  }) : super(
          fetchMovies: favoritesRepository.getFavoriteMovies,
          initialListDisplayMode: ListDisplayMode.grid2,
        ) {
    eventBus.on<RemoveMovieFromFavoritesEvent>().listen((event) {
      return removeMovie(movieId: event.movie.id);
    });
    eventBus.on<AddMovieToFavoritesEvent>().listen((event) {
      return addMovie(movie: event.movie);
    });
  }
}
