import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:moviebox/core/assets.dart';
import 'package:moviebox/core/styles.dart';
import 'splash_app_name.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    AppAssets.logo,
                    width: 64,
                    height: 64,
                  ),
                  const Gap(16),
                  const SplashAppName(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}