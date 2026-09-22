import 'package:flutter/material.dart';
import 'package:moviebox/Features/search/presentation/views/widgets/search_view_body.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SearchViewBody(),
        ),
      ),
    );
  }
}