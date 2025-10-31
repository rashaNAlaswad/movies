import 'package:flutter/material.dart';
import '../../../../core/helper/spacing.dart';
import '../../domain/entities/movie_details_entity.dart';
import 'movie_details_header.dart';
import 'movie_financial_section.dart';
import 'movie_genres_section.dart';
import 'movie_overview_section.dart';

class MovieDetailsBody extends StatelessWidget {
  final MovieDetailsEntity movie;

  const MovieDetailsBody({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MovieDetailsHeader(movie: movie),
          verticalSpace(16),
          if (movie.genres.isNotEmpty) ...[
            MovieGenresSection(genres: movie.genres),
            verticalSpace(16),
          ],
          MovieOverviewSection(overview: movie.overview),
          verticalSpace(16),
          if (movie.budget > 0 || movie.revenue > 0)
            MovieFinancialSection(budget: movie.budget, revenue: movie.revenue),
        ],
      ),
    );
  }
}
