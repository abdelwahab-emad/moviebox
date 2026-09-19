import 'package:flutter/material.dart';
import 'package:moviebox/core/styles.dart';

class CategoryTabs extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  static const labels = ['Popular', 'Top Rated', 'Now Playing'];

  const CategoryTabs({
    super.key,
    required this.selectedIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(labels.length, (index) {
        final isSelected = index == selectedIndex;
        return Padding(
          padding: const EdgeInsets.only(right: 8),
          child: GestureDetector(
            onTap: () => onChanged(index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.inputFocusBorder
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(1000),
                border: isSelected
                    ? null
                    : Border.all(color: AppColors.inputBorder),
              ),
              child: Text(
                labels[index],
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: isSelected ? Colors.white : AppColors.textSecondary,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
