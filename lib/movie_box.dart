import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviebox/Features/favorites/presentation/manger/cubit/favorites_cubit.dart';
import 'package:moviebox/core/di/service_locator.dart';
import 'package:moviebox/core/routes/app_router.dart';
import 'package:moviebox/core/routes/app_routes.dart';
import 'package:moviebox/core/styles.dart';

class MovieBox extends StatelessWidget {
  const MovieBox({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoritesCubit(getIt()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.background,
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: {
              TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            },
          ),
        ),
        initialRoute: AppRoutes.loginScreen,
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
