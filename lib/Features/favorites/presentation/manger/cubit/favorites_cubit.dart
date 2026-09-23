import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:moviebox/Features/favorites/data/repos/favorites_repo.dart';
import 'package:moviebox/Features/home/data/models/movie_model.dart';
import 'package:moviebox/core/networking/api_result.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit(this._favoritesRepo) : super(FavoritesInitial());

  final FavoritesRepo _favoritesRepo;

  Future<void> getFavorites() async {
    emit(FavoritesLoading());
    final result = await _favoritesRepo.getFavorites();

    switch (result) {
      case Success(data: final movies):
        emit(FavoritesSuccess(movies: movies));

      case Failure(message: final message):
        emit(FavoritesFailure(error: message));
    }
  }

  Future<void> addFavorite(MovieModel movie) async {
    final result = await _favoritesRepo.addFavorite(movie);

    switch (result) {
      case Success():
        await getFavorites();

      case Failure(message: final message):
        emit(FavoritesFailure(error: message));
    }
  }

  Future<void> removeFavorite(int movieId) async {
    final result = await _favoritesRepo.removeFavorite(movieId);

    switch (result) {
      case Success():
        await getFavorites();

      case Failure(message: final message):
        emit(FavoritesFailure(error: message));
    }
  }
}
