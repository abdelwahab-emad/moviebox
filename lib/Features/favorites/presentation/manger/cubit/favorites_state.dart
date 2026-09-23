part of 'favorites_cubit.dart';

@immutable
sealed class FavoritesState {}

final class FavoritesInitial extends FavoritesState {}

final class FavoritesLoading extends FavoritesState {}

final class FavoritesSuccess extends FavoritesState {
  final List<MovieModel> movies;
  FavoritesSuccess({required this.movies});
}

final class FavoritesFailure extends FavoritesState {
  final String error;
  FavoritesFailure({required this.error});
}
