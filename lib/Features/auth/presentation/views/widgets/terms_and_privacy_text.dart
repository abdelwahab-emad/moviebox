import 'package:flutter/material.dart';
import 'package:moviebox/core/utils/styles.dart';

class TermsAndPrivacyText extends StatelessWidget {
  const TermsAndPrivacyText({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        const Text(
          'By creating an account, you agree to our ',
          style: AppTextStyles.terms,
        ),
        GestureDetector(
          onTap: () {},
          child: const Text(
            'Terms of Service',
            style: AppTextStyles.termsLink,
          ),
        ),
        const Text(
          ' and ',
          style: AppTextStyles.terms,
        ),
        GestureDetector(
          onTap: () {},
          child: const Text(
            'Privacy Policy',
            style: AppTextStyles.termsLink,
          ),
        ),
        const Text(
          '.',
          style: AppTextStyles.terms,
        ),
      ],
    );
  }
}