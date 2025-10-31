import 'movie_entity.dart';

class PopularMoviesResponse {
  final List<MovieEntity> movies;
  final int totalPages;

  PopularMoviesResponse({required this.movies, required this.totalPages});
}
