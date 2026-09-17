import 'package:flutter/material.dart';
import 'package:moviebox/core/routes/app_router.dart';
import 'package:moviebox/core/routes/app_routes.dart';
import 'package:moviebox/core/styles.dart';

class MovieBox extends StatelessWidget {
  const MovieBox({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    );
  }
}
