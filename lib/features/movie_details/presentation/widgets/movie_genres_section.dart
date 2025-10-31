import 'package:flutter/material.dart';
import '../../../../core/helper/spacing.dart';
import 'section_title.dart';

import '../../../../core/theme/app_colors.dart';

class MovieGenresSection extends StatelessWidget {
  final List<String> genres;

  const MovieGenresSection({super.key, required this.genres});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(title: 'Genres'),
        verticalSpace(8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: genres.map((genre) => GenreChip(genre: genre)).toList(),
        ),
      ],
    );
  }
}

class GenreChip extends StatelessWidget {
  final String genre;

  const GenreChip({super.key, required this.genre});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(genre),
      backgroundColor: AppColors.tealPrimary.withValues(alpha: 0.5),
      side: BorderSide(color: AppColors.tealPrimary.withValues(alpha: 0.5)),
    );
  }
}
