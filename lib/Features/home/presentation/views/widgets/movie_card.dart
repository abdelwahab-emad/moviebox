import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:moviebox/Features/home/data/models/movie_model.dart';
import 'package:moviebox/core/networking/api_constants.dart';
import 'package:moviebox/core/styles.dart';
import 'package:moviebox/core/widgets/star_rating.dart';

class MovieCard extends StatelessWidget {
  final MovieModel movie;
  final VoidCallback? onTap;

  const MovieCard({super.key, required this.movie, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 2 / 3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: _buildPoster(),
            ),
          ),
          const Gap(6),
          Text(
            movie.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Gap(2),
          StarRating(voteAverage: movie.voteAverage),
        ],
      ),
    );
  }

  Widget _buildPoster() {
    if (movie.posterPath == null) {
      return Container(
        color: AppColors.inputBackground,
        child: const Icon(
          Icons.movie_outlined,
          color: AppColors.textHint,
          size: 32,
        ),
      );
    }

    return Image.network(
      '${ApiConstants.imageBaseUrl}${movie.posterPath}',
      fit: BoxFit.cover,
      loadingBuilder: (context, child, progress) {
        if (progress == null) return child;
        return Container(color: AppColors.inputBackground);
      },
      errorBuilder: (context, error, stackTrace) {
        return Container(
          color: AppColors.inputBackground,
          child: const Icon(
            Icons.broken_image_outlined,
            color: AppColors.textHint,
          ),
        );
      },
    );
  }
}

