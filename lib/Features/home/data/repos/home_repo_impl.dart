import 'package:dio/dio.dart';
import 'package:moviebox/Features/home/data/models/movie_model.dart';
import 'package:moviebox/Features/home/data/repos/home_repo.dart';
import 'package:moviebox/core/networking/api_constants.dart';
import 'package:moviebox/core/networking/api_error_handler.dart';
import 'package:moviebox/core/networking/api_result.dart';

class HomeRepoImpl implements HomeRepo {
  final Dio _dio;
  HomeRepoImpl(this._dio);
  @override
  Future<ApiResult<List<MovieModel>>> getPopularMovies() async {
    try {
      final response = await _dio.get(ApiConstants.popularMovies);
      final movies = _mapToMovieList(response.data);
      return Success(movies);
    } catch (e) {
      return Failure(ApiErrorHandler.handle(e).message);
    }
  }

  @override
  Future<ApiResult<List<MovieModel>>> getTopRatedMovies() async {
    try {
      final response = await _dio.get(ApiConstants.topRatedMovies);
      final movies = _mapToMovieList(response.data);
      return Success(movies);
    } catch (e) {
      return Failure(ApiErrorHandler.handle(e).message);
    }
  }

  @override
  Future<ApiResult<List<MovieModel>>> getNowPlayingMovies() async {
    try {
      final response = await _dio.get(ApiConstants.nowPlayingMovies);
      final movies = _mapToMovieList(response.data);
      return Success(movies);
    } catch (e) {
      return Failure(ApiErrorHandler.handle(e).message);
    }
  }

  @override
  Future<ApiResult<MovieModel>> getMovieDetails(int movieId) async {
    try {
      final response = await _dio.get(ApiConstants.movieDetails(movieId));
      final movie = MovieModel.fromJson(response.data);
      return Success(movie);
    } catch (e) {
      return Failure(ApiErrorHandler.handle(e).message);
    }
  }

  @override
  Future<ApiResult<List<MovieModel>>> getSimilarMovies(int movieId) async {
    try {
      final response = await _dio.get(ApiConstants.similarMovies(movieId));
      final movies = _mapToMovieList(response.data);
      return Success(movies);
    } catch (e) {
      return Failure(ApiErrorHandler.handle(e).message);
    }
  }

  List<MovieModel> _mapToMovieList(dynamic responseData) {
    final List results = responseData['results'] ?? [];
    return results.map((json) => MovieModel.fromJson(json)).toList();
  }
}
