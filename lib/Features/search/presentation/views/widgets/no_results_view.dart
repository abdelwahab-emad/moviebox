import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:moviebox/core/styles.dart';

class NoResultsView extends StatelessWidget {
  const NoResultsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('🎬', style: TextStyle(fontSize: 40)),
          Gap(16),
          Text(
            'No results',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          Gap(6),
          Text(
            'Try a different search term',
            style: TextStyle(color: AppColors.accentLink, fontSize: 13),
          ),
        ],
      ),
    );
  }
}