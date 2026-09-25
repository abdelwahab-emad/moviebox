import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:moviebox/core/navigation_controller.dart';
import 'package:moviebox/core/styles.dart';

class FavoritesEmptyState extends StatelessWidget {
  const FavoritesEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: const BoxDecoration(
              color: AppColors.inputBackground,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.favorite_border,
              color: AppColors.favouriteInactive,
              size: 30,
            ),
          ),
          const Gap(20),
          Text(
            'Nothing saved yet',
            style: AppTextStyles.body.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
          const Gap(8),
          const Text(
            'Tap the heart on any movie to save\nit here for later.',
            textAlign: TextAlign.center,
            style: AppTextStyles.terms,
          ),
          const Gap(28),
          SizedBox(
            width: 180,
            child: ElevatedButton(
              onPressed: () {
                NavController.selectedIndex.value = 0;
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.favouriteInactive,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'Browse Movies',
                style: AppTextStyles.button.copyWith(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
