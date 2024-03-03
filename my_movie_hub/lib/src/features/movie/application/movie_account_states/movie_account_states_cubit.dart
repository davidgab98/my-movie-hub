import 'package:my_movie_hub/src/core/enums/state_status.dart';
import 'package:my_movie_hub/src/core/events/event_bus.dart';
import 'package:my_movie_hub/src/core/events/events.dart';
import 'package:my_movie_hub/src/core/exceptions/exceptions_helper.dart';
import 'package:my_movie_hub/src/core/utils/safe_cubit.dart';
import 'package:my_movie_hub/src/features/movie/application/movie_account_states/movie_account_states_state.dart';
import 'package:my_movie_hub/src/features/movie/domain/model/movie.dart';
import 'package:my_movie_hub/src/features/movie/domain/repositories/movie_repository.dart';

class MovieAccountStatesCubit extends SafeCubit<MovieAccountStatesState>
    with ExceptionsHelper {
  MovieAccountStatesCubit({
    required Movie movie,
    required MovieRepository movieRepository,
    required IEventBus eventBus,
    AccountStates? accountStates,
  })  : _movieRepository = movieRepository,
        _eventBus = eventBus,
        _movie = movie,
        super(const MovieAccountStatesState()) {
    if (accountStates != null) {
      emit(
        state.copyWith(
          getAccountStatesStatus: StateStatus.loaded,
          isFavorite: accountStates.favorite,
          isInWatchlist: accountStates.watchlist,
          rating: null, //accountStates.rated,
        ),
      );
    }
  }

  final Movie _movie;
  final MovieRepository _movieRepository;
  final IEventBus _eventBus;

  Future<void> getAccountStates(int movieId) async {
    if (state.getAccountStatesStatus.isLoading) return;

    emit(state.copyWith(getAccountStatesStatus: StateStatus.loading));

    final result = await _movieRepository.getMovieAccountStates(
      movieId: movieId,
    );

    result.when(
      (success) {
        emit(
          state.copyWith(
            isFavorite: success.favorite,
            isInWatchlist: success.watchlist,
            rating: null, // success.rated,
            getAccountStatesStatus: StateStatus.loaded,
          ),
        );
      },
      (error) => emit(
        state.copyWith(
          errorMessage: getExceptionMessage(error),
          getAccountStatesStatus: StateStatus.error,
        ),
      ),
    );
  }

  Future<void> toggleFavoritesStatus() async {
    if (state.toggleFavoritesStatus.isLoading) return;

    emit(state.copyWith(toggleFavoritesStatus: StateStatus.loading));

    final result = await _movieRepository.toggleMovieFavoriteStatus(
      movieId: _movie.id,
      addToFavorites: !state.isFavorite,
    );

    result.when(
      (success) {
        _eventBus.emitEvent(
          !state.isFavorite
              ? AddMovieToFavoritesEvent(movie: _movie)
              : RemoveMovieFromFavoritesEvent(movie: _movie),
        );
        emit(
          state.copyWith(
            isFavorite: !state.isFavorite,
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
    if (state.toggleWatchlistStatus.isLoading) return;

    emit(state.copyWith(toggleWatchlistStatus: StateStatus.loading));

    final result = await _movieRepository.toggleMovieWatchlistStatus(
      movieId: _movie.id,
      addToWatchlist: !state.isInWatchlist,
    );

    result.when(
      (success) {
        _eventBus.emitEvent(
          !state.isInWatchlist
              ? AddMovieToWatchlistEvent(movie: _movie)
              : RemoveMovieFromWatchlistEvent(movie: _movie),
        );
        emit(
          state.copyWith(
            isInWatchlist: !state.isInWatchlist,
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
    if (state.addRatingStatus.isLoading) return;

    emit(state.copyWith(addRatingStatus: StateStatus.loading));

    final result = await _movieRepository.addMovieRating(
      movieId: _movie.id,
      rating: rating,
    );

    result.when(
      (success) {
        _eventBus.emitEvent(
          RateMovieEvent(movie: _movie, rate: rating),
        );
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
