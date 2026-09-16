import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:moviebox/Features/auth/presentation/manger/register_cubit.dart/register_cubit.dart';
import 'package:moviebox/Features/auth/presentation/views/widgets/custom_auth_button.dart';
import 'package:moviebox/Features/auth/presentation/views/widgets/custom_auth_text_field.dart';
import 'package:moviebox/core/utils/assets.dart';
import 'package:moviebox/core/utils/routes/app_routes.dart';
import 'package:moviebox/core/utils/styles.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            Navigator.pushReplacementNamed(context, AppRoutes.loginScreen);
          } else if (state is RegisterFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        builder: (context, state) {
          final isLoading = state is RegisterLoading;

          return SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
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
                  ),
                  const Gap(24),
                  Row(
                    children: [
                      SvgPicture.asset(AppAssets.logo, width: 38, height: 38),
                      const Gap(10),
                      SvgPicture.asset(AppAssets.movieBoxTitle, height: 26),
                    ],
                  ),
                  const Gap(20),
                  const Text('Create account', style: AppTextStyles.heading),
                  const Gap(6),
                  const Text(
                    'Join millions of movie lovers',
                    style: AppTextStyles.subtitle,
                  ),
                  const Gap(28),
                  const Text('FULL NAME', style: AppTextStyles.label),
                  const Gap(8),
                  CustomAuthTextField(
                    controller: nameController,
                    hint: 'Alex Morgan',
                  ),
                  const Gap(18),
                  const Text('EMAIL', style: AppTextStyles.label),
                  const Gap(8),
                  CustomAuthTextField(
                    controller: emailController,
                    hint: 'alex@email.com',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const Gap(18),
                  const Text('PASSWORD', style: AppTextStyles.label),
                  const Gap(8),
                  CustomAuthTextField(
                    controller: passwordController,
                    hint: 'Min. 8 characters',
                    obscureText: true,
                  ),
                  const Gap(16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'By creating an account, you agree to our ',
                            style: TextStyle(
                              fontSize: 11,
                              color: Color(0xFF6C727F),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: const Text(
                              'Terms of Service ',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF5B7FFF),
                              ),
                            ),
                          ),
                          const Text(
                            'and ',
                            style: TextStyle(
                              fontSize: 11,
                              color: Color(0xFF6C727F),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: const Text(
                              'Privacy Policy',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF5B7FFF),
                              ),
                            ),
                          ),
                          const Text(
                            '.',
                            style: TextStyle(
                              fontSize: 11,
                              color: Color(0xFF6C727F),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Gap(24),
                  CustomAuthButton(
                    text: 'Create account',
                    isLoading: isLoading,
                    gradient: const LinearGradient(
                      colors: [Color(0xFF269E75), Color(0xFF49D19E)],
                    ),
                    shadowColor: const Color(
                      0xFF38B28B,
                    ).withValues(alpha: 0.25),
                    onPressed: () => _register(context),
                  ),
                  const Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account? ',
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColors.textSecondary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pushReplacementNamed(
                          context,
                          AppRoutes.loginScreen,
                        ),
                        child: const Text(
                          'Log in',
                          style: TextStyle(
                            fontSize: 13,
                            color: AppColors.accentLink,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Gap(16),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _register(BuildContext context) {
    context.read<RegisterCubit>().register(
      name: nameController.text.trim(),
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
  }
}
