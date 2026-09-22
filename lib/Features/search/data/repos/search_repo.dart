import 'package:moviebox/Features/home/data/models/movie_model.dart';
import 'package:moviebox/core/networking/api_result.dart';

abstract class SearchRepo {
  Future<ApiResult<List<MovieModel>>> searchMovies(String query);
  Future<ApiResult<List<MovieModel>>> getTrendingMovies();
}
