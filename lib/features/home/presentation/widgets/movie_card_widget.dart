import 'package:flutter/material.dart';
import 'package:movie/core/helper/navigation_extensions.dart';

import '../../../../core/helper/spacing.dart';
import '../../../../core/router/routes.dart';
import '../../domain/entities/movie_entity.dart';
import 'movie_image.dart';
import 'movie_rating.dart';
import 'movie_release_year.dart';
import 'movie_title.dart';

class MovieCardWidget extends StatelessWidget {
  final MovieEntity movie;

  const MovieCardWidget({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () {
          context.pushNamed(Routes.details, arguments: movie.id);
        },
        borderRadius: BorderRadius.circular(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MovieImage(image: movie.fullPosterPath),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MovieTitle(title: movie.title),
                  verticalSpace(4),
                  Row(
                    children: [
                      MovieRating(voteAverage: movie.voteAverage),
                      const Spacer(),
                      MovieReleaseYear(releaseDate: movie.releaseDate),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
