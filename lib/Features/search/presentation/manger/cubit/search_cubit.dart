import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:moviebox/Features/home/data/models/movie_model.dart';
import 'package:moviebox/Features/search/data/repos/search_repo.dart';
import 'package:moviebox/core/networking/api_result.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._searchRepo) : super(SearchInitial());

  final SearchRepo _searchRepo;
  Future<void> searchMovies(String query) async {
    if (query.trim().isEmpty) {
      emit(SearchInitial());
      return;
    }

    emit(SearchLoading());
    final result = await _searchRepo.searchMovies(query);

    switch (result) {
      case Success(data: final movies):
        emit(SearchSucces(movies: movies));
      case Failure(message: final message):
        emit(SearchFailure(error: message));
    }
  }
}
