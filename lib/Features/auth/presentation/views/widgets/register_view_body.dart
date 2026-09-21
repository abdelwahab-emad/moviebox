import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:moviebox/Features/auth/presentation/manger/register_cubit.dart/register_cubit.dart';
import 'package:moviebox/Features/auth/presentation/views/widgets/auth_back_button.dart';
import 'package:moviebox/Features/auth/presentation/views/widgets/custom_button.dart';
import 'package:moviebox/Features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:moviebox/Features/auth/presentation/views/widgets/register_header.dart';
import 'package:moviebox/Features/auth/presentation/views/widgets/terms_and_privacy_text.dart';
import 'package:moviebox/core/routes/app_routes.dart';
import 'package:moviebox/core/styles.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  final _formKey = GlobalKey<FormState>();
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

  String? _validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your full name';
    }
    if (value.trim().length < 2) return 'Name is too short';
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) return 'Please enter your email';
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value.trim())) return 'Please enter a valid email';
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Please enter a password';
    if (value.length < 8) return 'Password must be at least 8 characters';
    return null;
  }

  void _register(BuildContext context) {
    if (!_formKey.currentState!.validate()) return;

    context.read<RegisterCubit>().register(
      name: nameController.text.trim(),
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        final isLoading = state is RegisterLoading;

        return SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AuthBackButton(),
                  const Gap(24),
                  RegisterHeader(),
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
                  CustomTextField(
                    controller: nameController,
                    hint: 'Alex Morgan',
                    validator: _validateName,
                  ),
                  const Gap(18),
                  const Text('EMAIL', style: AppTextStyles.label),
                  const Gap(8),
                  CustomTextField(
                    controller: emailController,
                    hint: 'alex@email.com',
                    keyboardType: TextInputType.emailAddress,
                    validator: _validateEmail,
                  ),
                  const Gap(18),
                  const Text('PASSWORD', style: AppTextStyles.label),
                  const Gap(8),
                  CustomTextField(
                    controller: passwordController,
                    hint: 'Min. 8 characters',
                    obscureText: true,
                    validator: _validatePassword,
                  ),
                  const Gap(16),
                  const TermsAndPrivacyText(),
                  const Gap(24),
                  CustomButton(
                    text: 'Create account',
                    isLoading: isLoading,
                    gradient: const LinearGradient(
                      colors: [Color(0xFF269E75), Color(0xFF49D19E)],
                    ),
                    shadowColor: AppColors.primaryButton.withValues(
                      alpha: 0.25,
                    ),
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
          ),
        );
      },
    );
  }
}