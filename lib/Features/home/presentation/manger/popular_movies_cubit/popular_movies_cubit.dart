import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:moviebox/Features/home/data/models/movie_model.dart';
import 'package:moviebox/Features/home/data/repos/home_repo.dart';
import 'package:moviebox/core/networking/api_result.dart';

part 'popular_movies_state.dart';

class PopularMoviesCubit extends Cubit<PopularMoviesState> {
  PopularMoviesCubit(this._homeRepo) : super(PopularMoviesInitial());

  final HomeRepo _homeRepo;

  Future<void> getPopularMovies() async {
    emit(PopularMoviesLoading());

    final result = await _homeRepo.getPopularMovies();

    switch (result) {
      case Success(data: final movies):
        emit(PopularMoviesSuccess(movies: movies));
      case Failure(message: final messsage):
        emit(PopularMoviesFailure(error: messsage));
    }
  }
}
