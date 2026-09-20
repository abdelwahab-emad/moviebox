part of 'movie_details_cubit.dart';

@immutable
sealed class MovieDetailsState {}

final class MovieDetailsInitial extends MovieDetailsState {}

final class MovieDetailsLoading extends MovieDetailsState {}

final class MovieDetailsSuccess extends MovieDetailsState {
  final MovieModel movie;
  final List<MovieModel> similarMovies;

  MovieDetailsSuccess({required this.movie, required this.similarMovies});
}

final class MovieDetailsFailure extends MovieDetailsState {
  final String error;
  MovieDetailsFailure({required this.error});
}