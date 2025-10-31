import 'package:flutter/material.dart';
import '../../../../core/helper/spacing.dart';
import '../../domain/entities/movie_details_entity.dart';
import 'movie_rating_info.dart';

class MovieDetailsInfo extends StatelessWidget {
  final MovieDetailsEntity movie;

  const MovieDetailsInfo({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (movie.tagline != null && movie.tagline!.isNotEmpty)
          Text(
            movie.tagline!,
            style: const TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        if (movie.tagline != null && movie.tagline!.isNotEmpty)
          verticalSpace(8),
        MovieRatingInfo(voteAverage: movie.voteAverage),
        verticalSpace(8),
        Text(
          'Release: ${movie.releaseDate}',
          style: const TextStyle(fontSize: 14),
        ),
        verticalSpace(4),
        Text(
          'Runtime: ${movie.formattedRuntime}',
          style: const TextStyle(fontSize: 14),
        ),
        verticalSpace(4),
        Text('Status: ${movie.status}', style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}
