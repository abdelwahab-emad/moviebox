import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:moviebox/Features/home/presentation/manger/now_playing_movies_cubit/now_playing_movies_cubit.dart';
import 'package:moviebox/Features/home/presentation/manger/popular_movies_cubit/popular_movies_cubit.dart';
import 'package:moviebox/Features/home/presentation/manger/top_rated_movies_cubit/top_rated_movies_cubit.dart';
import 'package:moviebox/Features/home/presentation/views/widgets/category_tabs.dart';
import 'package:moviebox/Features/home/presentation/views/widgets/home_search_field.dart';
import 'package:moviebox/Features/home/presentation/views/widgets/home_tabs_content.dart';
import 'package:moviebox/Features/home/presentation/views/widgets/home_top_bar.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeScreenBody> {
  int _selectedTab = 0;

  @override
  void initState() {
    super.initState();
    context.read<PopularMoviesCubit>().getPopularMovies();
    context.read<TopRatedMoviesCubit>().getTopRatedMovies();
    context.read<NowPlayingMoviesCubit>().getNowPlayingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(8),
        const HomeTopBar(),
        const Gap(16),
        const HomeSearchField(),
        const Gap(16),
        CategoryTabs(
          selectedIndex: _selectedTab,
          onChanged: (index) => setState(() => _selectedTab = index),
        ),
        Expanded(child: HomeTabsContent(selectedIndex: _selectedTab)),
      ],
    );
  }
}
