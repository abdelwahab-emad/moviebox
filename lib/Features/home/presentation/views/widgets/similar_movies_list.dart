import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:moviebox/Features/home/data/models/movie_model.dart';
import 'package:moviebox/Features/home/presentation/views/widgets/movie_card.dart';
import 'package:moviebox/core/routes/app_routes.dart';
import 'package:moviebox/core/styles.dart';

class SimilarMoviesList extends StatelessWidget {
  final List<MovieModel> movies;

  const SimilarMoviesList({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    if (movies.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Similar Movies',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
        ),
        const Gap(12),
        SizedBox(
          height: 200,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            separatorBuilder: (_, _) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final movie = movies[index];
              return GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(
                    context,
                    AppRoutes.movieDetailsScreen,
                    arguments: movie.id,
                  );
                },
                child: SizedBox(width: 100, child: MovieCard(movie: movie)),
              );
            },
          ),
        ),
      ],
    );
  }
}
