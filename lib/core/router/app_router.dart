import 'package:flutter/material.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import 'routes.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
    return null;
  }
}
