import 'package:flutter/material.dart';
import 'package:moviebox/Features/favorites/presentation/views/favorites_screen.dart';
import 'package:moviebox/Features/home/presentation/views/home_screen.dart';
import 'package:moviebox/Features/main_navigation/persentation/views/widgets/custom_bottom_nav_bar.dart';
import 'package:moviebox/Features/profile/presentation/views/profile_view.dart';
import 'package:moviebox/Features/search/presentation/views/search_screen.dart';
import 'package:moviebox/core/navigation_controller.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  final List<Widget> _tabs = const [
    HomeScreen(),
    SearchScreen(),
    FavoritesScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: NavController.selectedIndex,
      builder: (context, selectedIndex, _) {
        return Scaffold(
          body: IndexedStack(index: selectedIndex, children: _tabs),
          bottomNavigationBar: CustomBottomNavBar(
            selectedIndex: selectedIndex,
            onTap: (index) => NavController.selectedIndex.value = index,
          ),
        );
      },
    );
  }
}
