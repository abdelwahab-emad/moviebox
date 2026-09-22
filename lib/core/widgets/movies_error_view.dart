import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:moviebox/core/styles.dart';

class MoviesErrorView extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;

  const MoviesErrorView({super.key, required this.message, this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.error_outline, color: AppColors.error, size: 32),
          const Gap(8),
          Text(
            message,
            style: const TextStyle(color: AppColors.textSecondary),
            textAlign: TextAlign.center,
          ),
          if (onRetry != null) ...[
            const Gap(12),
            TextButton(onPressed: onRetry, child: const Text('Retry')),
          ],
        ],
      ),
    );
  }
}