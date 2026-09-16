import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviebox/Features/auth/presentation/manger/login_cubit/login_cubit.dart';
import 'package:moviebox/Features/auth/presentation/views/widgets/login_view_body.dart';
import 'package:moviebox/core/utils/styles.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            // TODO: replace with AppRoutes.homeScreen once Home exists
           // Navigator.pushReplacementNamed(context, AppRoutes.homeScreen);
          } else if (state is LoginFailure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        child: const LoginViewBody(),
      ),
    );
  }
}