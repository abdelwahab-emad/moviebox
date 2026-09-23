import 'package:moviebox/Features/home/data/models/movie_model.dart';
import 'package:moviebox/core/networking/api_result.dart';

abstract class FavoritesRepo {
  Future<ApiResult<void>> addFavorite(MovieModel movie);
  Future<ApiResult<void>> removeFavorite(int movieId);
  Future<ApiResult<List<MovieModel>>> getFavorites();
}
