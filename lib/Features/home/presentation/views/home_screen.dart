import 'package:flutter/material.dart';
import 'package:moviebox/Features/home/presentation/views/widgets/home_screen_body.dart';
import 'package:moviebox/core/styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: HomeScreenBody(),
        ),
      ),
    );
  }
}
