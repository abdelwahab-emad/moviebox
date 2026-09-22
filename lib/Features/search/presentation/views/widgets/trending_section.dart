import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:moviebox/Features/search/presentation/manger/trending_cubit/trending_cubit.dart';
import 'package:moviebox/Features/search/presentation/views/widgets/movie_results_list.dart';
import 'package:moviebox/core/styles.dart';
import 'package:moviebox/core/widgets/movies_error_view.dart';
import 'package:moviebox/core/widgets/movies_loading_view.dart';


class TrendingSection extends StatelessWidget {
  const TrendingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('TRENDING NOW', style: AppTextStyles.label),
        const Gap(10),
        Expanded(
          child: BlocBuilder<TrendingCubit, TrendingState>(
            builder: (context, state) {
              if (state is TrendingLoading || state is TrendingInitial) {
                return const MoviesLoadingView();
              }
              if (state is TrendingFailure) {
                return MoviesErrorView(message: state.error);
              }
              if (state is TrendingSuccess) {
                return MovieResultsList(movies: state.movies);
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ],
    );
  }
}
