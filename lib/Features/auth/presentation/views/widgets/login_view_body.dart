import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:moviebox/Features/auth/presentation/manger/login_cubit/login_cubit.dart';
import 'package:moviebox/Features/auth/presentation/views/widgets/auth_divider.dart';
import 'package:moviebox/Features/auth/presentation/views/widgets/login_header.dart';
import 'package:moviebox/Features/auth/presentation/views/widgets/custom_button.dart';
import 'package:moviebox/Features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:moviebox/core/assets.dart';
import 'package:moviebox/core/routes/app_routes.dart';
import 'package:moviebox/core/styles.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) return 'Please enter your email';
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value.trim())) return 'Please enter a valid email';
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Please enter your password';
    return null;
  }

  void _login(BuildContext context) {
    if (!_formKey.currentState!.validate()) return;

    context.read<LoginCubit>().login(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        final isLoading = state is LoginLoading;

        return SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  AuthHeader(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Welcome back',
                          style: AppTextStyles.heading,
                        ),
                        const Gap(6),
                        const Text(
                          'Sign in to continue watching',
                          style: AppTextStyles.subtitle,
                        ),
                        const Gap(28),
                        const Text('EMAIL', style: AppTextStyles.label),
                        const Gap(8),
                        CustomTextField(
                          controller: emailController,
                          hint: 'alex.morgan@email.com',
                          keyboardType: TextInputType.emailAddress,
                          validator: _validateEmail,
                        ),
                        const Gap(18),
                        const Text('PASSWORD', style: AppTextStyles.label),
                        const Gap(8),
                        CustomTextField(
                          controller: passwordController,
                          hint: '••••••••',
                          obscureText: true,
                          validator: _validatePassword,
                        ),
                        const Gap(8),
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {
                            },
                            child: Text(
                              'Forgot password?',
                              style: AppTextStyles.termsLink.copyWith(
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),

                        const Gap(20),
                        CustomButton(
                          text: 'Log in',
                          isLoading: isLoading,
                          gradient: const LinearGradient(
                            colors: [Color(0xFF6C63E8), Color(0xFF534AB7)],
                          ),
                          shadowColor: AppColors.inputFocusBorder.withValues(
                            alpha: 0.3,
                          ),
                          onPressed: () => _login(context),
                        ),

                        const Gap(18),
                        AuthDivider(),
                        const Gap(18),

                        CustomButton(
                          text: 'Continue with Google',
                          backgroundColor: AppColors.inputBackground,
                          borderColor: AppColors.inputBorder,
                          textColor: AppColors.textPrimary,
                          icon: SvgPicture.asset(
                            AppAssets.googleLogo,
                            width: 18,
                            height: 18,
                          ),
                          onPressed: () {
                            context.read<LoginCubit>().loginWithGoogle();
                          },
                        ),

                        const Gap(24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don't have an account? ",
                              style: TextStyle(
                                fontSize: 13,
                                color: AppColors.textSecondary,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            GestureDetector(
                              onTap: () => Navigator.pushReplacementNamed(
                                context,
                                AppRoutes.registerScreen,
                              ),
                              child: const Text(
                                'Sign up',
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}