import 'package:flutter/material.dart';
import 'package:moviebox/Features/home/data/models/movie_model.dart';
import 'package:moviebox/Features/home/presentation/views/widgets/movies_grid_view.dart';
import 'package:moviebox/core/widgets/movies_error_view.dart';
import 'package:moviebox/core/widgets/movies_loading_view.dart';

class MoviesStateView extends StatelessWidget {
  final List<MovieModel>? movies;
  final String? error;

  const MoviesStateView({super.key, this.movies, this.error});

  @override
  Widget build(BuildContext context) {
    if (movies != null) return MoviesGridView(movies: movies!);
    if (error != null) return MoviesErrorView(message: error!);
    return const MoviesLoadingView();
  }
}
