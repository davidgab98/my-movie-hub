import 'package:bloc/bloc.dart';
import 'package:my_movie_hub/src/core/enums/state_status.dart';
import 'package:my_movie_hub/src/core/exceptions/exceptions_helper.dart';
import 'package:my_movie_hub/src/features/favorites/application/favorites_list_state.dart';
import 'package:my_movie_hub/src/features/favorites/domain/repositories/favorites_repository.dart';

class FavoritesListCubit extends Cubit<FavoritesListState>
    with ExceptionsHelper {
  FavoritesListCubit({required FavoritesRepository favoritesRepository})
      : _favoritesRepository = favoritesRepository,
        super(const FavoritesListState());

  final FavoritesRepository _favoritesRepository;

  Future<void> getFavoriteMovies() async {
    emit(state.copyWith(status: StateStatus.loading));

    final result = await _favoritesRepository.getFavoriteMovies();

    result.when(
      (success) => emit(
        state.copyWith(
          movies: success,
          status: StateStatus.loaded,
        ),
      ),
      (error) => emit(
        state.copyWith(
          errorMessage: getExceptionMessage(error),
          status: StateStatus.error,
        ),
      ),
    );
  }
}
