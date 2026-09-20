import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:moviebox/core/styles.dart';

class MovieStatsRow extends StatelessWidget {
  final double rating;
  final String year;
  final String runtime;

  const MovieStatsRow({
    super.key,
    required this.rating,
    required this.year,
    required this.runtime,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.inputBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          _buildStat('RATING', '⭐ ${rating.toStringAsFixed(1)}'),
          _buildDivider(),
          _buildStat('YEAR', year),
          _buildDivider(),
          _buildStat('RUNTIME', runtime),
        ],
      ),
    );
  }

  Widget _buildStat(String label, String value) {
    return Expanded(
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Gap(2),
          Text(
            label,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Container(width: 1, height: 30, color: AppColors.inputBorder);
  }
}
