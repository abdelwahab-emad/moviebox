import 'package:flutter/material.dart';
import 'package:moviebox/Features/home/data/models/movie_model.dart';
import 'package:moviebox/core/networking/api_constants.dart';
import 'package:moviebox/core/styles.dart';

class MovieBackdropHeader extends StatelessWidget {
  final MovieModel movie;
  final bool isFavorite;
  final VoidCallback onFavoriteTap;

  const MovieBackdropHeader({
    super.key,
    required this.movie,
    required this.isFavorite,
    required this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: Stack(
        fit: StackFit.expand,
        children: [
          _buildImage(),
          Positioned(
            top: 12,
            left: 12,
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: const CircleAvatar(
                radius: 18,
                backgroundColor: Colors.black45,
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 12,
            right: 12,
            child: GestureDetector(
              onTap: onFavoriteTap,
              child: CircleAvatar(
                radius: 18,
                backgroundColor: AppColors.favourite.withValues(alpha: 0.85),
                child: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.redAccent : Colors.white,
                  size: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImage() {
    if (movie.backdropPath == null) {
      return Container(color: AppColors.inputBackground);
    }
    return Image.network(
      '${ApiConstants.imageBaseUrl}${movie.backdropPath}',
      fit: BoxFit.cover,
      loadingBuilder: (context, child, progress) {
        if (progress == null) return child;
        return Container(color: AppColors.inputBackground);
      },
      errorBuilder: (context, error, stackTrace) {
        return Container(color: AppColors.inputBackground);
      },
    );
  }
}
