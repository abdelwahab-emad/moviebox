import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviebox/Features/auth/presentation/manger/register_cubit.dart/register_cubit.dart';
import 'package:moviebox/Features/auth/presentation/views/widgets/register_view_body.dart';
import 'package:moviebox/core/utils/routes/app_routes.dart';
import 'package:moviebox/core/utils/styles.dart';


class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: BlocListener<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            Navigator.pushReplacementNamed(context, AppRoutes.loginScreen);
          } else if (state is RegisterFailure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        child: const RegisterViewBody(),
      ),
    );
  }
}