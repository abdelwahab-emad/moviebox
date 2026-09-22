import 'package:flutter/material.dart';
import 'package:moviebox/Features/home/data/models/movie_model.dart';
import 'package:moviebox/Features/search/presentation/views/widgets/movie_list_tile.dart';
import 'package:moviebox/core/routes/app_routes.dart';
import 'package:moviebox/core/styles.dart';

class MovieResultsList extends StatelessWidget {
  final List<MovieModel> movies;

  const MovieResultsList({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: movies.length,
      separatorBuilder: (_, _) => Divider(color: AppColors.inputBorder, height: 1),
      itemBuilder: (context, index) => MovieListTile(
        movie: movies[index],
        rank: index + 1,
        onTap: () {
          Navigator.pushNamed(
            context,
            AppRoutes.movieDetailsScreen,
            arguments: movies[index].id,
          );
        },
      ),
    );
  }
}