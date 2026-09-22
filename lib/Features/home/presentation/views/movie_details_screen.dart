import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviebox/Features/home/presentation/manger/move_details_cubit/movie_details_cubit.dart';
import 'package:moviebox/Features/home/presentation/views/widgets/movie_details_body.dart';
import 'package:moviebox/core/widgets/movies_error_view.dart';
import 'package:moviebox/core/widgets/movies_loading_view.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
        builder: (context, state) {
          if (state is MovieDetailsSuccess) {
            return MovieDetailsBody(state: state);
          }
          if (state is MovieDetailsFailure) {
            return SafeArea(child: MoviesErrorView(message: state.error));
          }
          return const MoviesLoadingView();
        },
      ),
    );
  }
}
