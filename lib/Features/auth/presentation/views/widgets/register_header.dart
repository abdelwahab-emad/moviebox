import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:moviebox/core/assets.dart';

class RegisterHeader extends StatelessWidget {
  const RegisterHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          AppAssets.logo,
          width: 38,
          height: 38,
        ),
        const Gap(10),
        SvgPicture.asset(
          AppAssets.movieBoxTitle,
          height: 26,
        ),
      ],
    );
  }
}