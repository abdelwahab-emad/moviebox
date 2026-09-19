import 'package:moviebox/Features/home/data/models/movie_model.dart';
import 'package:moviebox/core/networking/api_result.dart';

abstract class HomeRepo {
  Future<ApiResult<List<MovieModel>>> getPopularMovies();
  Future<ApiResult<List<MovieModel>>> getTopRatedMovies();
  Future<ApiResult<List<MovieModel>>> getNowPlayingMovies();
}
