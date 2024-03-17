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
    emit(state.copyWith(accountStates: accountStates));
  }

  final Movie _movie;
  final MovieRepository _movieRepository;
  final IEventBus _eventBus;

  Future<void> toggleFavoritesStatus() async {
    if (state.toggleFavoritesStatus.isLoading || state.accountStates == null) {
      return;
    }

    emit(state.copyWith(toggleFavoritesStatus: StateStatus.loading));

    final result = await _movieRepository.toggleMovieFavoriteStatus(
      movieId: _movie.id,
      addToFavorites: !state.accountStates!.favorite,
    );

    result.when(
      (success) {
        _eventBus.emitEvent(
          !state.accountStates!.favorite
              ? AddMovieToFavoritesEvent(movie: _movie)
              : RemoveMovieFromFavoritesEvent(movie: _movie),
        );
        emit(
          state.copyWith(
            accountStates: state.accountStates!.copyWith(
              favorite: !state.accountStates!.favorite,
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
    if (state.toggleWatchlistStatus.isLoading || state.accountStates == null) {
      return;
    }

    emit(state.copyWith(toggleWatchlistStatus: StateStatus.loading));

    final result = await _movieRepository.toggleMovieWatchlistStatus(
      movieId: _movie.id,
      addToWatchlist: !state.accountStates!.watchlist,
    );

    result.when(
      (success) {
        _eventBus.emitEvent(
          !state.accountStates!.watchlist
              ? AddMovieToWatchlistEvent(movie: _movie)
              : RemoveMovieFromWatchlistEvent(movie: _movie),
        );
        emit(
          state.copyWith(
            accountStates: state.accountStates!.copyWith(
              watchlist: !state.accountStates!.watchlist,
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
    if (state.addRatingStatus.isLoading || state.accountStates == null) {
      return;
    }

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
