import 'package:flutter/material.dart';
import 'package:moviebox/core/styles.dart';

class GenreChips extends StatelessWidget {
  final List<String> genres;

  const GenreChips({super.key, required this.genres});

  @override
  Widget build(BuildContext context) {
    if (genres.isEmpty) return const SizedBox.shrink();

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: genres.map((genre) => _buildChip(genre)).toList(),
    );
  }

  Widget _buildChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: AppColors.inputFocusBorder),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: AppColors.accentLink,
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
