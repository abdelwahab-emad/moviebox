import 'package:flutter/material.dart';
import 'package:moviebox/Features/search/presentation/views/widgets/recent_search_chip.dart';
import 'package:moviebox/core/styles.dart';

class RecentSearchesSection extends StatelessWidget {
  final List<String> terms;
  final ValueChanged<String> onTapTerm;

  const RecentSearchesSection({
    super.key,
    required this.terms,
    required this.onTapTerm,
  });

  @override
  Widget build(BuildContext context) {
    if (terms.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('RECENT SEARCHES', style: AppTextStyles.label),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: terms
              .map((term) => RecentSearchChip(label: term, onTap: () => onTapTerm(term)))
              .toList(),
        ),
      ],
    );
  }
}