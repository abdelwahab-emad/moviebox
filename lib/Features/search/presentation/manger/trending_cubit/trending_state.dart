part of 'trending_cubit.dart';

@immutable
sealed class TrendingState {}

final class TrendingInitial extends TrendingState {}

final class TrendingLoading extends TrendingState {}

final class TrendingSuccess extends TrendingState {
  final List<MovieModel> movies;
  TrendingSuccess({required this.movies});
}

final class TrendingFailure extends TrendingState {
  final String error;
  TrendingFailure({required this.error});
}