import 'package:flutter/material.dart';
import '../../domain/entities/movie_entity.dart';
import 'movie_card_widget.dart';
import '../../../../core/widgets/circular_indicator.dart';

class MoviesGridView extends StatelessWidget {
  final ScrollController scrollController;
  final List<MovieEntity> movies;
  final bool hasMorePages;

  const MoviesGridView({
    super.key,
    required this.scrollController,
    required this.movies,
    required this.hasMorePages,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: scrollController,
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: movies.length + (hasMorePages ? 1 : 0),
      itemBuilder: (context, index) {
        if (index >= movies.length) {
          return const CircularIndicator();
        }
        final movie = movies[index];
        return MovieCardWidget(movie: movie);
      },
    );
  }
}
