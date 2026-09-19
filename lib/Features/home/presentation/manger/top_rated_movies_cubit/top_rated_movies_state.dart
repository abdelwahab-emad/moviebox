part of 'top_rated_movies_cubit.dart';

@immutable
sealed class TopRatedMoviesState {}

final class TopRatedMoviesInitial extends TopRatedMoviesState {}

final class TopRatedMoviesLoading extends TopRatedMoviesState {}

final class TopRatedMoviesSuccess extends TopRatedMoviesState {
  final List<MovieModel> movies;
  TopRatedMoviesSuccess({required this.movies});
}

final class TopRatedMoviesFailure extends TopRatedMoviesState {
  final String error;
  TopRatedMoviesFailure({required this.error});
}
