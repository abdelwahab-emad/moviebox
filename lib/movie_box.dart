import 'package:flutter/material.dart';
import 'package:moviebox/core/utils/routes/app_router.dart';
import 'package:moviebox/core/utils/routes/app_routes.dart';
import 'package:moviebox/core/utils/styles.dart';

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
      initialRoute: AppRoutes.registerScreen,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
