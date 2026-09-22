import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:moviebox/Features/home/data/models/movie_model.dart';
import 'package:moviebox/Features/search/data/repos/search_repo.dart';
import 'package:moviebox/core/networking/api_result.dart';

part 'trending_state.dart';

class TrendingCubit extends Cubit<TrendingState> {
  TrendingCubit(this._searchRepo) : super(TrendingInitial());

  final SearchRepo _searchRepo;

  Future<void> loadTrending() async {
    emit(TrendingLoading());
    final result = await _searchRepo.getTrendingMovies();

    switch (result) {
      case Success(data: final movies):
        emit(TrendingSuccess(movies: movies));
      case Failure(message: final message):
        emit(TrendingFailure(error: message));
    }
  }
}