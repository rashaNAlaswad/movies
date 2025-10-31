import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/theme_toggle_button.dart';
import '../../domain/entities/movie_details_entity.dart';
import 'movie_backdrop_image.dart';

class MovieDetailsAppBar extends StatelessWidget {
  final MovieDetailsEntity movie;

  const MovieDetailsAppBar({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 300,
      pinned: true,
      actions: const [ThemeToggleButton()],
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          movie.title,
          style: const TextStyle(color: AppColors.white),
        ),
        background: MovieBackdropImage(backdropPath: movie.fullBackdropPath),
      ),
    );
  }
}
