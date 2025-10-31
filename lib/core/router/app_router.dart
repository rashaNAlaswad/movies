import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/movie_details/presentation/cubit/movie_details_cubit.dart';
import '../di/dependency_injection.dart';
import '../../features/home/presentation/cubit/home_cubit.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/movie_details/presentation/screens/movie_details_screen.dart';
import 'routes.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<HomeCubit>()..fetchFirstPage(),
            child: const HomeScreen(),
          ),
        );
      case Routes.details:
        final movieId = settings.arguments as int;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                getIt<MovieDetailsCubit>()..fetchMovieDetails(movieId),
            child: MovieDetailsScreen(movieId: movieId),
          ),
        );
      default:
        return null;
    }
  }
}
