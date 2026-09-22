import 'package:flutter/material.dart';

class MoviesLoadingView extends StatelessWidget {
  const MoviesLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
