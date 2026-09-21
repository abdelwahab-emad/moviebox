part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchSucces extends SearchState {
  final List<MovieModel> movies;
  SearchSucces({required this.movies});
}

final class SearchFailure extends SearchState {
  final String error;
  SearchFailure({required this.error});
}
