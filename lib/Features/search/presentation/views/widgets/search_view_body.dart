import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:moviebox/Features/search/presentation/manger/search_cubit/search_cubit.dart';
import 'package:moviebox/Features/search/presentation/views/widgets/recent_search_section.dart';
import 'package:moviebox/Features/search/presentation/views/widgets/search_result_view.dart';
import 'package:moviebox/core/styles.dart';
import 'package:moviebox/core/widgets/custom_text_field.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  final _controller = TextEditingController();
  Timer? _debounce;

  final List<String> _recentSearches = [
    'Dune',
    'Christopher Nolan',
    'Sci-Fi',
    'Parasite',
    '2024',
  ];

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _onQueryChanged(String query) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      context.read<SearchCubit>().searchMovies(query);
    });
  }

  void _searchFor(String term) {
    _controller.text = term;
    context.read<SearchCubit>().searchMovies(term);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(8),
        const Text('Search', style: AppTextStyles.heading),
        const Gap(16),
        CustomTextField(
          controller: _controller,
          hint: 'Movies, genres, directors...',
          onChanged: _onQueryChanged,
          prefixIcon: const Icon(Icons.search, color: AppColors.textHint),
        ),
        const Gap(20),
        RecentSearchesSection(terms: _recentSearches, onTapTerm: _searchFor),
        const Gap(20),
        const Expanded(child: SearchResultsView()),
      ],
    );
  }
}
