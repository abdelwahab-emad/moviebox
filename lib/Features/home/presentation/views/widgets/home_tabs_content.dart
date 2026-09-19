import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviebox/Features/home/presentation/manger/now_playing_movies_cubit/now_playing_movies_cubit.dart';
import 'package:moviebox/Features/home/presentation/manger/popular_movies_cubit/popular_movies_cubit.dart';
import 'package:moviebox/Features/home/presentation/manger/top_rated_movies_cubit/top_rated_movies_cubit.dart';
import 'package:moviebox/Features/home/presentation/views/widgets/movies_state_view.dart';

class HomeTabsContent extends StatelessWidget {
  final int selectedIndex;

  const HomeTabsContent({super.key, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    switch (selectedIndex) {
      case 1:
        return BlocBuilder<TopRatedMoviesCubit, TopRatedMoviesState>(
          builder: (context, state) => MoviesStateView(
            movies: state is TopRatedMoviesSuccess ? state.movies : null,
            error: state is TopRatedMoviesFailure ? state.error : null,
          ),
        );

      case 2:
        return BlocBuilder<NowPlayingMoviesCubit, NowPlayingMoviesState>(
          builder: (context, state) => MoviesStateView(
            movies: state is NowPlayingMoviesSuccess ? state.movies : null,
            error: state is NowPlayingMoviesFailure ? state.error : null,
          ),
        );

      default:
        return BlocBuilder<PopularMoviesCubit, PopularMoviesState>(
          builder: (context, state) => MoviesStateView(
            movies: state is PopularMoviesSuccess ? state.movies : null,
            error: state is PopularMoviesFailure ? state.error : null,
          ),
        );
    }
  }
}
