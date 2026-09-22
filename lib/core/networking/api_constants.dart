class ApiConstants {
  ApiConstants._();

  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String accessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2YjkxMmY3ZjJhNGQ4M2E0N2NmODM2NTViOTZkYzc0NSIsIm5iZiI6MTc4OTM4MDk3Mi41ODMwMDAyLCJzdWIiOiI2YWE3Yzk2YzJlMGYyNDUzMDg2NGIzZmQiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.TnxpJnDLpN49CqRmHaD7ES8ix9xIrEXefdUL1WWo48E';

  static const String popularMovies = '/movie/popular';
  static const String topRatedMovies = '/movie/top_rated';
  static const String nowPlayingMovies = '/movie/now_playing';
  static const String trendingMovies = '/trending/movie/day';
  static const String genreList = '/genre/movie/list';
  static String movieDetails(int movieId) => '/movie/$movieId';
  static String similarMovies(int movieId) => '/movie/$movieId/similar';
  static String searchMovies = '/search/movie';
 

  static const String imageBaseUrl = 'https://image.tmdb.org/t/p/w500';
}
