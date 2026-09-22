import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviebox/Features/search/presentation/manger/search_cubit/search_cubit.dart';
import 'package:moviebox/Features/search/presentation/views/widgets/no_results_view.dart';
import 'package:moviebox/Features/search/presentation/views/widgets/movie_results_list.dart';
import 'package:moviebox/Features/search/presentation/views/widgets/trending_section.dart';
import 'package:moviebox/core/widgets/movies_error_view.dart';
import 'package:moviebox/core/widgets/movies_loading_view.dart';


class SearchResultsView extends StatelessWidget {
  const SearchResultsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchInitial) {
          return const TrendingSection();
        }
        if (state is SearchLoading) {
          return const MoviesLoadingView();
        }
        if (state is SearchFailure) {
          return MoviesErrorView(message: state.error);
        }
        if (state is SearchSuccess) {
          if (state.movies.isEmpty) {
            return const NoResultsView();
          }
          return MovieResultsList(movies: state.movies);
        }
        return const SizedBox.shrink();
      },
    );
  }
}