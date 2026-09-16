import 'package:flutter/material.dart';
import 'package:moviebox/core/utils/routes/app_router.dart';
import 'package:moviebox/core/utils/routes/app_routes.dart';

class MovieBox extends StatelessWidget {
  const MovieBox({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.registerScreen,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
