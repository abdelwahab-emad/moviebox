import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:moviebox/Features/home/data/models/movie_model.dart';
import 'package:moviebox/Features/home/data/repos/home_repo.dart';
import 'package:moviebox/core/networking/api_result.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  MovieDetailsCubit(this._homeRepo) : super(MovieDetailsInitial());

  final HomeRepo _homeRepo;

  Future<void> getMovieDetails(int movieId) async {
    emit(MovieDetailsLoading());

    final detailsResult = await _homeRepo.getMovieDetails(movieId);

    switch (detailsResult) {
      case Success(data: final movie):
        final similarResult = await _homeRepo.getSimilarMovies(movieId);
        final List<MovieModel> similarMovies;
        switch (similarResult) {
          case Success(data: final movies):
            similarMovies = movies;
          case Failure():
            similarMovies = [];
        }
        emit(MovieDetailsSuccess(movie: movie, similarMovies: similarMovies));
      case Failure(message: final message):
        emit(MovieDetailsFailure(error: message));
    }
  }
}
