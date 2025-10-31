import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helper/spacing.dart';
import '../cubit/movie_details_cubit.dart';

class MovieDetailsError extends StatelessWidget {
  final dynamic error;
  final int movieId;

  const MovieDetailsError({
    super.key,
    required this.error,
    required this.movieId,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 64, color: Colors.red),
          verticalSpace(16),
          Text(
            error.message ?? 'Failed to load movie details',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
          verticalSpace(16),
          ElevatedButton(
            onPressed: () {
              context.read<MovieDetailsCubit>().fetchMovieDetails(movieId);
            },
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}
