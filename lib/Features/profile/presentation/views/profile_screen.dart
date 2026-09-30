import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:moviebox/Features/auth/data/repos/auth_repo.dart';
import 'package:moviebox/Features/profile/presentation/manger/profile/profile_cubit.dart';
import 'package:moviebox/core/di/service_locator.dart';
import 'package:moviebox/core/routes/app_routes.dart';
import 'package:moviebox/core/styles.dart';
import 'package:moviebox/core/widgets/custom_button.dart';
import 'package:moviebox/core/widgets/custom_text_field.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late final TextEditingController _nameController;
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final cubit = context.read<ProfileCubit>();
    _nameController = TextEditingController(text: cubit.currentName);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _logOut() async {
    await getIt<AuthRepo>().logOut();
    if (!mounted) return;
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.loginScreen,
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: BlocListener<ProfileCubit, ProfileState>(
          listener: (context, state) {
            if (state is ProfileUpdateSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
            if (state is ProfileFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error), backgroundColor: AppColors.error),
              );
            }
          },
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                final isLoading = state is ProfileLoading;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(8),
                    const Text('Profile', style: AppTextStyles.heading),
                    const Gap(24),

                    const Text('EMAIL', style: AppTextStyles.label),
                    const Gap(8),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.inputBackground,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        context.read<ProfileCubit>().currentEmail,
                        style: const TextStyle(color: AppColors.textSecondary, fontSize: 14),
                      ),
                    ),
                    const Gap(18),

                    const Text('FULL NAME', style: AppTextStyles.label),
                    const Gap(8),
                    CustomTextField(controller: _nameController, hint: 'Your name'),
                    const Gap(10),
                    CustomButton(
                      text: 'Update Name',
                      isLoading: isLoading,
                      backgroundColor: AppColors.inputBackground,
                      onPressed: () =>
                          context.read<ProfileCubit>().updateName(_nameController.text.trim()),
                    ),
                    const Gap(24),

                    const Text('NEW PASSWORD', style: AppTextStyles.label),
                    const Gap(8),
                    CustomTextField(
                      controller: _passwordController,
                      hint: 'Min. 8 characters',
                      obscureText: true,
                    ),
                    const Gap(10),
                    CustomButton(
                      text: 'Update Password',
                      isLoading: isLoading,
                      backgroundColor: AppColors.inputBackground,
                      onPressed: () => context
                          .read<ProfileCubit>()
                          .updatePassword(_passwordController.text.trim()),
                    ),

                    const Gap(40),
                    CustomButton(
                      text: 'Log out',
                      backgroundColor: Colors.transparent,
                      borderColor: AppColors.error,
                      textColor: AppColors.error,
                      onPressed: _logOut,
                    ),
                    const Gap(20),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}