import 'package:dio/dio.dart';
import 'package:moviebox/Features/home/data/models/movie_model.dart';
import 'package:moviebox/Features/search/data/repos/search_repo.dart';
import 'package:moviebox/core/networking/api_constants.dart';
import 'package:moviebox/core/networking/api_error_handler.dart';
import 'package:moviebox/core/networking/api_result.dart';

class SearchRepoImpl extends SearchRepo {
  final Dio _dio;
  SearchRepoImpl(this._dio);

  @override
  Future<ApiResult<List<MovieModel>>> searchMovies(String query) async {
    try {
      final response = await _dio.get(
        ApiConstants.searchMovies,
        queryParameters: {'query': query},
      );

      final List results = response.data['results'] ?? [];
      final movies = results.map((json) => MovieModel.fromJson(json)).toList();
      return Success(movies);
    } catch (e) {
      return Failure(ApiErrorHandler.handle(e).message);
    }
  }
}
