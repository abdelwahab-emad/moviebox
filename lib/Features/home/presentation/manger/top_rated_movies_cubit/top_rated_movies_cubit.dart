import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:moviebox/Features/home/data/models/movie_model.dart';
import 'package:moviebox/Features/home/data/repos/home_repo.dart';
import 'package:moviebox/core/networking/api_result.dart';

part 'top_rated_movies_state.dart';

class TopRatedMoviesCubit extends Cubit<TopRatedMoviesState> {
  TopRatedMoviesCubit(this._homeRepo) : super(TopRatedMoviesInitial());

  final HomeRepo _homeRepo;

  Future<void> getTopRatedMovies() async {
    emit(TopRatedMoviesLoading());

    final result = await _homeRepo.getTopRatedMovies();

    switch (result) {
      case Success(data: final movies):
        emit(TopRatedMoviesSuccess(movies: movies));
      case Failure(message: final message):
        emit(TopRatedMoviesFailure(error: message));
    }
  }
}
