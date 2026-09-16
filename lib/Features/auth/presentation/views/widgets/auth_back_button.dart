import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:moviebox/core/utils/styles.dart';

class AuthBackButton extends StatelessWidget {
  const AuthBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(
            Icons.arrow_back_ios,
            size: 14,
            color: AppColors.textSecondary,
          ),
          Gap(6),
          Text(
            'Back',
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}