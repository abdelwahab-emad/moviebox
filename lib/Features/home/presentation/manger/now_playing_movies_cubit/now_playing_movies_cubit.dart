import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:moviebox/Features/home/data/models/movie_model.dart';
import 'package:moviebox/Features/home/data/repos/home_repo.dart';
import 'package:moviebox/core/networking/api_result.dart';

part 'now_playing_movies_state.dart';

class NowPlayingMoviesCubit extends Cubit<NowPlayingMoviesState> {
  NowPlayingMoviesCubit(this._homeRepo) : super(NowPlayingMoviesInitial());

  final HomeRepo _homeRepo;

  Future<void> getNowPlayingMovies() async {
    emit(NowPlayingMoviesLoading());

    final result = await _homeRepo.getNowPlayingMovies();

    switch (result) {
      case Success(data: final movies):
        emit(NowPlayingMoviesSuccess(movies: movies));
      case Failure(message: final message):
        emit(NowPlayingMoviesFailure(error: message));
    }
  }
}
