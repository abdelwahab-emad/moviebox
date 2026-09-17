import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviebox/Features/auth/presentation/manger/login_cubit/login_cubit.dart';
import 'package:moviebox/Features/auth/presentation/manger/register_cubit.dart/register_cubit.dart';
import 'package:moviebox/Features/auth/presentation/views/login_screen.dart';
import 'package:moviebox/Features/auth/presentation/views/register_screen.dart';
import 'package:moviebox/core/di/service_locator.dart';
import 'package:moviebox/core/routes/app_routes.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splashScreen:
      // return MaterialPageRoute(builder: (_) => const SplashScreen());
      case AppRoutes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => LoginCubit(getIt()),
            child: const LoginScreen(),
          ),
        );
      case AppRoutes.registerScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => RegisterCubit(getIt()),
            child: const RegisterScreen(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
