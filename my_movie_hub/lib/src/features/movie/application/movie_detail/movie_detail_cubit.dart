import 'package:my_movie_hub/src/core/enums/state_status.dart';
import 'package:my_movie_hub/src/core/events/event_bus.dart';
import 'package:my_movie_hub/src/core/events/events.dart';
import 'package:my_movie_hub/src/core/exceptions/exceptions_helper.dart';
import 'package:my_movie_hub/src/core/utils/safe_cubit.dart';
import 'package:my_movie_hub/src/features/movie/application/movie_detail/movie_detail_state.dart';
import 'package:my_movie_hub/src/features/movie/domain/model/movie.dart';
import 'package:my_movie_hub/src/features/movie/domain/repositories/movie_repository.dart';

class MovieDetailCubit extends SafeCubit<MovieDetailState>
    with ExceptionsHelper {
  MovieDetailCubit({
    required Movie movie,
    required MovieRepository movieRepository,
    required IEventBus eventBus,
  })  : _movieRepository = movieRepository,
        _eventBus = eventBus,
        _movie = movie,
        super(const MovieDetailState()) {
    emit(state.copyWith(movie: DetailedMovie.fromMovie(movie)));

    eventBus.on<RemoveMovieFromWatchlistEvent>().listen((event) {
      return _updateMovieAccountStates(
        accountStates: state.movie.accountStates?.copyWith(watchlist: false),
      );
    });
    eventBus.on<AddMovieToWatchlistEvent>().listen((event) {
      return _updateMovieAccountStates(
        accountStates: state.movie.accountStates?.copyWith(watchlist: true),
      );
    });
    eventBus.on<RemoveMovieFromFavoritesEvent>().listen((event) {
      return _updateMovieAccountStates(
        accountStates: state.movie.accountStates?.copyWith(favorite: false),
      );
    });
    eventBus.on<AddMovieToFavoritesEvent>().listen((event) {
      return _updateMovieAccountStates(
        accountStates: state.movie.accountStates?.copyWith(favorite: true),
      );
    });
    eventBus.on<RateMovieEvent>().listen((event) {
      return _updateMovieAccountStates(
        accountStates: state.movie.accountStates?.copyWith(rated: event.rate),
      );
    });
  }

  final Movie _movie;
  final MovieRepository _movieRepository;
  final IEventBus _eventBus;

  Future<void> getMovieDetails() async {
    if (state.status.isLoading) return;

    emit(state.copyWith(status: StateStatus.loading));

    await Future<void>.delayed(const Duration(seconds: 2));
    final result = await _movieRepository.getMovieDetails(
      movieId: state.movie.id,
    );

    result.when(
      (success) {
        emit(
          state.copyWith(
            movie: success,
            status: StateStatus.loaded,
          ),
        );
      },
      (error) => emit(
        state.copyWith(
          errorMessage: getExceptionMessage(error),
          status: StateStatus.error,
        ),
      ),
    );
  }

  void _updateMovieAccountStates({AccountStates? accountStates}) {
    emit(
      state.copyWith(
        movie: state.movie.copyWith(accountStates: accountStates),
      ),
    );
  }

  Future<void> toggleFavoritesStatus() async {
    if (state.toggleFavoritesStatus.isLoading ||
        state.movie.accountStates == null) {
      return;
    }

    emit(state.copyWith(toggleFavoritesStatus: StateStatus.loading));

    final result = await _movieRepository.toggleMovieFavoriteStatus(
      movieId: state.movie.id,
      addToFavorites: !state.movie.accountStates!.favorite,
    );

    result.when(
      (success) {
        _eventBus.emitEvent(
          !state.movie.accountStates!.favorite
              ? AddMovieToFavoritesEvent(movie: _movie)
              : RemoveMovieFromFavoritesEvent(movie: _movie),
        );
        emit(
          state.copyWith(
            movie: state.movie.copyWith(
              accountStates: state.movie.accountStates!.copyWith(
                favorite: !state.movie.accountStates!.favorite,
              ),
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
    if (state.toggleWatchlistStatus.isLoading ||
        state.movie.accountStates == null) {
      return;
    }

    emit(state.copyWith(toggleWatchlistStatus: StateStatus.loading));

    final result = await _movieRepository.toggleMovieWatchlistStatus(
      movieId: _movie.id,
      addToWatchlist: !state.movie.accountStates!.watchlist,
    );

    result.when(
      (success) {
        _eventBus.emitEvent(
          !state.movie.accountStates!.watchlist
              ? AddMovieToWatchlistEvent(movie: _movie)
              : RemoveMovieFromWatchlistEvent(movie: _movie),
        );
        emit(
          state.copyWith(
            movie: state.movie.copyWith(
              accountStates: state.movie.accountStates!.copyWith(
                watchlist: !state.movie.accountStates!.watchlist,
              ),
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
    if (state.addRatingStatus.isLoading || state.movie.accountStates == null) {
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
            movie: state.movie.copyWith(
              accountStates: state.movie.accountStates!.copyWith(rated: rating),
            ),
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

  Future<void> removeRating() async {
    if (state.removeRatingStatus.isLoading ||
        state.movie.accountStates == null) {
      return;
    }

    emit(state.copyWith(removeRatingStatus: StateStatus.loading));

    final result = await _movieRepository.removeMovieRating(
      movieId: _movie.id,
    );

    result.when(
      (success) {
        _eventBus.emitEvent(
          RateMovieEvent(movie: _movie),
        );
        emit(
          state.copyWith(
            movie: state.movie.copyWith(
              accountStates: state.movie.accountStates!.copyWith(rated: null),
            ),
            removeRatingStatus: StateStatus.loaded,
          ),
        );
      },
      (error) => emit(
        state.copyWith(
          errorMessage: getExceptionMessage(error),
          removeRatingStatus: StateStatus.error,
        ),
      ),
    );
  }
}
