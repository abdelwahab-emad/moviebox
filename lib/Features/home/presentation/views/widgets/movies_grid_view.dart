import 'package:flutter/material.dart';
import 'package:moviebox/Features/home/data/models/movie_model.dart';
import 'package:moviebox/Features/home/presentation/views/widgets/movie_card.dart';
import 'package:moviebox/core/styles.dart';

class MoviesGridView extends StatelessWidget {
  final List<MovieModel> movies;

  const MoviesGridView({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    if (movies.isEmpty) {
      return const Center(
        child: Text(
          'No movies found',
          style: TextStyle(color: AppColors.textSecondary),
        ),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.only(top: 16, bottom: 24),
      itemCount: movies.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        childAspectRatio: 0.48,
      ),
      itemBuilder: (context, index) {
        final movie = movies[index];
        return MovieCard(movie: movie, onTap: () {});
      },
    );
  }
}
