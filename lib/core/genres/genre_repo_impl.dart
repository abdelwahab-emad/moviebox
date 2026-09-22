import 'package:dio/dio.dart';
import 'package:moviebox/core/genres/genre_repo.dart';
import 'package:moviebox/core/networking/api_constants.dart';

class GenreRepoImpl extends GenreRepo {
  final Dio _dio;
  GenreRepoImpl(this._dio);

  @override
  Future<Map<int, String>> getGenreMap() async {
    try {
      final response = await _dio.get(ApiConstants.genreList);
      final List genres = response.data['genres'] ?? [];
      return {
        for (final g in genres) 
         g['id'] as int: g['name'] as String
      };
    } catch (_) {
      return {};
    }
  }
}