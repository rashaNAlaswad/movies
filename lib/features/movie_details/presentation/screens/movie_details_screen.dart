import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/movie_details_app_bar.dart';
import '../widgets/movie_details_body.dart';
import '../widgets/movie_details_error.dart';

import '../../../../core/widgets/circular_indicator.dart';
import '../../domain/entities/movie_details_entity.dart';
import '../cubit/movie_details_cubit.dart';

class MovieDetailsScreen extends StatelessWidget {
  final int movieId;

  const MovieDetailsScreen({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
        builder: (context, state) {
          if (state is MovieDetailsLoading) {
            return const CircularIndicator();
          } else if (state is MovieDetailsSuccess) {
            return MovieDetailsContent(movie: state.movieDetails);
          } else if (state is MovieDetailsFailure) {
            return MovieDetailsError(error: state.error, movieId: movieId);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class MovieDetailsContent extends StatelessWidget {
  final MovieDetailsEntity movie;

  const MovieDetailsContent({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        MovieDetailsAppBar(movie: movie),
        SliverToBoxAdapter(child: MovieDetailsBody(movie: movie)),
      ],
    );
  }
}
