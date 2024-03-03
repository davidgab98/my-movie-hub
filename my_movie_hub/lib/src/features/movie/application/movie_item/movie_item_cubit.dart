import 'package:bloc/bloc.dart';
import 'package:my_movie_hub/src/core/enums/state_status.dart';
import 'package:my_movie_hub/src/core/events/event_bus.dart';
import 'package:my_movie_hub/src/core/events/events.dart';
import 'package:my_movie_hub/src/core/exceptions/exceptions_helper.dart';
import 'package:my_movie_hub/src/features/movie/application/movie_item/movie_item_state.dart';
import 'package:my_movie_hub/src/features/movie/domain/model/movie.dart';
import 'package:my_movie_hub/src/features/movie/domain/repositories/movie_repository.dart';

class MovieItemCubit extends Cubit<MovieItemState> with ExceptionsHelper {
  MovieItemCubit({
    required Movie movie,
    required MovieRepository movieRepository,
    required IEventBus eventBus,
  })  : _movieRepository = movieRepository,
        _eventBus = eventBus,
        super(MovieItemState(movie: movie));

  final MovieRepository _movieRepository;
  final IEventBus _eventBus;

  Future<void> getMovieAccountStates() async {
    if (state.accountStatesStatus.isLoading) return;

    emit(state.copyWith(accountStatesStatus: StateStatus.loading));

    final result = await _movieRepository.getMovieAccountStates(
      movieId: state.movie.id,
    );

    result.when(
      (success) {
        emit(
          state.copyWith(
            movie: state.movie.copyWith(accountStates: success),
            accountStatesStatus: StateStatus.loaded,
          ),
        );
      },
      (error) => emit(
        state.copyWith(
          errorMessage: getExceptionMessage(error),
          accountStatesStatus: StateStatus.error,
        ),
      ),
    );
  }

  Future<void> toggleFavoritesStatus() async {
    if (state.movie.accountStates == null ||
        state.toggleFavoritesStatus.isLoading) return;

    emit(state.copyWith(toggleFavoritesStatus: StateStatus.loading));

    final result = await _movieRepository.toggleMovieFavoriteStatus(
      movieId: state.movie.id,
      addToFavorites: !state.movie.accountStates!.favorite,
    );

    result.when(
      (success) {
        _eventBus.emitEvent(
          !state.movie.accountStates!.favorite
              ? AddMovieToFavoritesEvent(movie: state.movie)
              : RemoveMovieFromFavoritesEvent(movie: state.movie),
        );
        emit(
          state.copyWith(
            movie: state.movie.copyWith(
              accountStates: state.movie.accountStates!
                  .copyWith(favorite: !state.movie.accountStates!.favorite),
            ),
            toggleFavoritesStatus: StateStatus.loaded,
          ),
        );
      },
      (error) => emit(
        state.copyWith(
          errorMessage: getExceptionMessage(error),
          toggleFavoritesStatus: StateStatus.error,
        ),
      ),
    );
  }

  Future<void> toggleWatchlistStatus() async {
    if (state.movie.accountStates == null ||
        state.toggleWatchlistStatus.isLoading) return;

    emit(state.copyWith(toggleWatchlistStatus: StateStatus.loading));

    final result = await _movieRepository.toggleMovieWatchlistStatus(
      movieId: state.movie.id,
      addToWatchlist: !state.movie.accountStates!.watchlist,
    );

    result.when(
      (success) {
        _eventBus.emitEvent(
          !state.movie.accountStates!.watchlist
              ? AddMovieToWatchlistEvent(movie: state.movie)
              : RemoveMovieFromWatchlistEvent(movie: state.movie),
        );
        emit(
          state.copyWith(
            movie: state.movie.copyWith(
              accountStates: state.movie.accountStates!
                  .copyWith(watchlist: !state.movie.accountStates!.watchlist),
            ),
            toggleWatchlistStatus: StateStatus.loaded,
          ),
        );
      },
      (error) => emit(
        state.copyWith(
          errorMessage: getExceptionMessage(error),
          toggleWatchlistStatus: StateStatus.error,
        ),
      ),
    );
  }

  Future<void> addRating({required double rating}) async {
    if (state.movie.accountStates == null || state.addRatingStatus.isLoading) {
      return;
    }

    emit(state.copyWith(addRatingStatus: StateStatus.loading));

    final result = await _movieRepository.addMovieRating(
      movieId: state.movie.id,
      rating: rating,
    );

    result.when(
      (success) {
        _eventBus.emitEvent(RateMovieEvent(movie: state.movie, rate: rating));
        emit(
          state.copyWith(
            addRatingStatus: StateStatus.loaded,
          ),
        );
      },
      (error) => emit(
        state.copyWith(
          errorMessage: getExceptionMessage(error),
          addRatingStatus: StateStatus.error,
        ),
      ),
    );
  }
}
