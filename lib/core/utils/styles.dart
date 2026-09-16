import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color background = Color(0xFF111315);
  static const Color inputBackground = Color(0xFF1E2024);
  static const Color inputBorder = Color(0xFF282B30);

  static const Color inputFocusBorder = Color(0xFF534AB7);
  static const Color cursor = Color(0xFFAFA9EC);
  static const Color error = Color(0xFFFF4D4F);

  static const Color primaryButton = Color(0xFF38B28B);
  static const Color accentLink = Color(0xFF5B7FFF);

  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Color(0xFF8E95A2);
  static const Color textHint = Color(0xFF5D636F);

}

class AppTextStyles {
  AppTextStyles._();

  static const TextStyle heading = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.w800,
    color: AppColors.textPrimary,
    letterSpacing: -0.5,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  static const TextStyle label = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w700,
    color: AppColors.textSecondary,
    letterSpacing: 0.8,
  );

  static const TextStyle body = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  static const TextStyle button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );

  static const TextStyle terms = TextStyle(
    fontSize: 11,
    color: AppColors.textSecondary,
    height: 1.4,
  );

  static const TextStyle termsLink = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w600,
    color: AppColors.accentLink,
  );
}