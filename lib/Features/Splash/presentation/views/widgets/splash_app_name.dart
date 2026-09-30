import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:moviebox/core/assets.dart';
import 'package:moviebox/core/styles.dart';

class SplashAppName extends StatelessWidget {
  const SplashAppName({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: SvgPicture.asset(
            AppAssets.movieBoxTitle,
            height: 28,
          ),
        ),
        const Gap(6),
        const Text(
          'DISCOVER · SAVE · WATCH',
          style: AppTextStyles.label,
        ),
      ],
    );
  }
}