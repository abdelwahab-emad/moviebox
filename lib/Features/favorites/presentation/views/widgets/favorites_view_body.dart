import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:moviebox/Features/favorites/presentation/manger/cubit/favorites_cubit.dart';
import 'package:moviebox/Features/favorites/presentation/views/widgets/favorites_empty_state.dart';
import 'package:moviebox/core/widgets/movies_error_view.dart';
import 'package:moviebox/core/widgets/movies_grid_view.dart';
import 'package:moviebox/core/widgets/movies_loading_view.dart';
import 'package:moviebox/core/styles.dart';

class FavoritesViewBody extends StatelessWidget {
  const FavoritesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: BlocBuilder<FavoritesCubit, FavoritesState>(
          builder: (context, state) {
            final count = state is FavoritesSuccess ? state.movies.length : 0;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(12),
                const Text('Saved', style: AppTextStyles.heading),
                const Gap(4),
                Text(
                  '$count movies saved',
                  style: AppTextStyles.subtitle.copyWith(
                    color: AppColors.favouriteInactive,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Gap(20),
                Expanded(
                  child: switch (state) {
                    FavoritesInitial() || FavoritesLoading() =>
                      const MoviesLoadingView(),

                    FavoritesSuccess(:final movies) => movies.isEmpty
                        ? const FavoritesEmptyState()
                        : MoviesGridView(movies: movies),

                    FavoritesFailure(:final error) => MoviesErrorView(
                        message: error,
                        onRetry: () =>
                            context.read<FavoritesCubit>().getFavorites(),
                      ),
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}