part of 'popular_movies_cubit.dart';

@immutable
sealed class PopularMoviesState {}

final class PopularMoviesInitial extends PopularMoviesState {}

final class PopularMoviesLoading extends PopularMoviesState {}

final class PopularMoviesSuccess extends PopularMoviesState {
  final List<MovieModel> movies;
  PopularMoviesSuccess({required this.movies});
}

final class PopularMoviesFailure extends PopularMoviesState {
  final String error;
  PopularMoviesFailure({required this.error});
}
