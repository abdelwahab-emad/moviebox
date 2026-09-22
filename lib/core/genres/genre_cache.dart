import 'package:moviebox/core/genres/genre_repo.dart';

class GenreCache {
  Map<int, String> _map = {};

  Future<void> load(GenreRepo repo) async {
    _map = await repo.getGenreMap();
  }

  String? nameFor(int? genreId) {
    if (genreId == null) return null;
    return _map[genreId];
  }
}