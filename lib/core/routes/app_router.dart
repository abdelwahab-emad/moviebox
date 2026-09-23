import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviebox/Features/auth/presentation/manger/login_cubit/login_cubit.dart';
import 'package:moviebox/Features/auth/presentation/manger/register_cubit.dart/register_cubit.dart';
import 'package:moviebox/Features/auth/presentation/views/login_screen.dart';
import 'package:moviebox/Features/auth/presentation/views/register_screen.dart';
import 'package:moviebox/Features/favorites/presentation/views/favorites_screen.dart';
import 'package:moviebox/Features/home/presentation/manger/move_details_cubit/movie_details_cubit.dart';
import 'package:moviebox/Features/home/presentation/manger/now_playing_movies_cubit/now_playing_movies_cubit.dart';
import 'package:moviebox/Features/home/presentation/manger/popular_movies_cubit/popular_movies_cubit.dart';
import 'package:moviebox/Features/home/presentation/manger/top_rated_movies_cubit/top_rated_movies_cubit.dart';
import 'package:moviebox/Features/home/presentation/views/home_screen.dart';
import 'package:moviebox/Features/home/presentation/views/movie_details_screen.dart';
import 'package:moviebox/Features/search/presentation/manger/search_cubit/search_cubit.dart';
import 'package:moviebox/Features/search/presentation/manger/trending_cubit/trending_cubit.dart';
import 'package:moviebox/Features/search/presentation/views/search_screen.dart';
import 'package:moviebox/core/di/service_locator.dart';
import 'package:moviebox/core/routes/app_routes.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splashScreen:
      // return MaterialPageRoute(builder: (_) => const SplashScreen());
      case AppRoutes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => LoginCubit(getIt()),
            child: const LoginScreen(),
          ),
        );
      case AppRoutes.registerScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => RegisterCubit(getIt()),
            child: const RegisterScreen(),
          ),
        );

      case AppRoutes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => PopularMoviesCubit(getIt())),
              BlocProvider(create: (context) => TopRatedMoviesCubit(getIt())),
              BlocProvider(create: (context) => NowPlayingMoviesCubit(getIt())),
            ],
            child: const HomeScreen(),
          ),
        );
      case AppRoutes.movieDetailsScreen:
        final movieId = settings.arguments as int;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                MovieDetailsCubit(getIt())..getMovieDetails(movieId),
            child: const MovieDetailsScreen(),
          ),
        );

      case AppRoutes.searchScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => SearchCubit(getIt())),
              BlocProvider(
                create: (context) => TrendingCubit(getIt())..loadTrending(),
              ),
            ],
            child: const SearchScreen(),
          ),
        );

      case AppRoutes.favoritesScreen:
        return MaterialPageRoute(builder: (_) => const FavoritesScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}