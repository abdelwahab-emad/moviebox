import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:moviebox/Features/home/data/models/movie_model.dart';
import 'package:moviebox/core/di/service_locator.dart';
import 'package:moviebox/core/genres/genre_cache.dart';
import 'package:moviebox/core/networking/api_constants.dart';
import 'package:moviebox/core/styles.dart';
import 'package:moviebox/core/widgets/star_rating.dart';

class MovieListTile extends StatelessWidget {
  final MovieModel movie;
  final int? rank;
  final VoidCallback? onTap;

  const MovieListTile({super.key, required this.movie, this.rank, this.onTap});

 
  @override
  Widget build(BuildContext context) {
    final year = movie.releaseDate?.split('-').first ?? '—';

    final genre = movie.genres.isNotEmpty
        ? movie.genres.first
        : (movie.genreIds.isNotEmpty
              ? getIt<GenreCache>().nameFor(movie.genreIds.first)
              : null);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            if (rank != null) ...[
              SizedBox(
                width: 20,
                child: Text(
                  '$rank',
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 13,
                  ),
                ),
              ),
              const Gap(8),
            ],
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                width: 48,
                height: 68,
                child: movie.posterPath == null
                    ? Container(color: AppColors.inputBackground)
                    : Image.network(
                        '${ApiConstants.imageBaseUrl}${movie.posterPath}',
                        fit: BoxFit.cover,
                        errorBuilder: (_, _, _) =>
                            Container(color: AppColors.inputBackground),
                      ),
              ),
            ),
            const Gap(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Gap(4),
                  Text(
                    year,
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 11,
                    ),
                  ),
                  const Gap(4),
                  StarRating(voteAverage: movie.voteAverage),
                ],
              ),
            ),
            if (genre != null)
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(999),
                  border: Border.all(color: AppColors.inputBorder),
                ),
                child: Text(
                  genre,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 10,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
