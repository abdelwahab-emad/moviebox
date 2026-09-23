import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:moviebox/Features/favorites/presentation/manger/cubit/favorites_cubit.dart';
import 'package:moviebox/Features/home/presentation/manger/move_details_cubit/movie_details_cubit.dart';
import 'package:moviebox/Features/home/presentation/views/widgets/genre_chips.dart';
import 'package:moviebox/Features/home/presentation/views/widgets/movie_backdrop_header.dart';
import 'package:moviebox/Features/home/presentation/views/widgets/movie_stats_row.dart';
import 'package:moviebox/Features/home/presentation/views/widgets/similar_movies_list.dart';
import 'package:moviebox/core/styles.dart';

class MovieDetailsBody extends StatelessWidget {
  final MovieDetailsSuccess state;

  const MovieDetailsBody({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final movie = state.movie;
    final year = movie.releaseDate?.split('-').first ?? '—';
    final runtime = movie.runtime != null ? '${movie.runtime}m' : '—';

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<FavoritesCubit, FavoritesState>(
            builder: (context, favState) {
              final isFavorite = favState is FavoritesSuccess &&
                  favState.movies.any((m) => m.id == movie.id);

              return MovieBackdropHeader(
                movie: movie,
                isFavorite: isFavorite,
                onFavoriteTap: () {
                  final favoritesCubit = context.read<FavoritesCubit>();
                  if (isFavorite) {
                    favoritesCubit.removeFavorite(movie.id);
                  } else {
                    favoritesCubit.addFavorite(movie);
                  }
                },
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(movie.title, style: AppTextStyles.heading),
                const Gap(12),
                GenreChips(genres: movie.genres),
                const Gap(16),
                Text(
                  'Overview',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                Gap(6),
                Text(
                  movie.overview,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    height: 1.5,
                    fontSize: 13,
                  ),
                ),
                const Gap(16),
                MovieStatsRow(
                  rating: movie.voteAverage,
                  year: year,
                  runtime: runtime,
                ),
                const Gap(24),
                SimilarMoviesList(movies: state.similarMovies),
              ],
            ),
          ),
        ],
      ),
    );
  }
}