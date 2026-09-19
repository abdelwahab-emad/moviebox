import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:moviebox/core/assets.dart';
import 'package:moviebox/core/styles.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(AppAssets.movieBoxTitle, height: 30),
            const Gap(2),
            const Text(
              'Discover your next watch',
              style: TextStyle(color: AppColors.textSecondary, fontSize: 14),
            ),
          ],
        ),
        const CircleAvatar(
          radius: 30,
          backgroundColor: AppColors.inputBackground,
          child: Icon(Icons.person, color: AppColors.textSecondary, size: 25),
        ),
      ],
    );
  }
}
