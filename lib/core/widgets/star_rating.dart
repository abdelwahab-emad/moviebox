import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:moviebox/core/styles.dart';

class StarRating extends StatelessWidget {
  final double voteAverage;

  const StarRating({super.key, required this.voteAverage});

  @override
  Widget build(BuildContext context) {
    final starsOutOfFive = voteAverage / 2;

    return Row(
      children: [
        ...List.generate(5, (index) {
          final filled = index < starsOutOfFive.round();
          return Icon(
            filled ? Icons.star_rounded : Icons.star_outline_rounded,
            color: AppColors.star,
            size: 11,
          );
        }),
        const Gap(4),
        Text(
          voteAverage.toStringAsFixed(1),
          style: const TextStyle(color: AppColors.textSecondary, fontSize: 11),
        ),
      ],
    );
  }
}
