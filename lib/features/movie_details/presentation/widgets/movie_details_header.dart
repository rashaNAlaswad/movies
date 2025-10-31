import 'package:flutter/material.dart';
import '../../../../core/helper/spacing.dart';
import '../../domain/entities/movie_details_entity.dart';
import 'movie_details_info.dart';
import 'movie_poster_image.dart';

class MovieDetailsHeader extends StatelessWidget {
  final MovieDetailsEntity movie;

  const MovieDetailsHeader({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (movie.fullPosterPath.isNotEmpty) ...[
          MoviePosterImage(imageUrl: movie.fullPosterPath),
          horizontalSpace(16),
        ],
        Expanded(child: MovieDetailsInfo(movie: movie)),
      ],
    );
  }
}
