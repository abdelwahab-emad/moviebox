import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:moviebox/core/assets.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF3A2E6E), Color(0xFF1B2A3D)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          SvgPicture.asset(
            AppAssets.logo,
            width: 56,
            height: 56,
          ),
          const Gap(10),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: SvgPicture.asset(
              AppAssets.movieBoxTitle,
              height: 26,
            ),
          ),
        ],
      ),
    );
  }
}