class MovieEntity {
  final int id;
  final String title;
  final String? posterPath;
  final double voteAverage;
  final String releaseDate;

  MovieEntity({
    required this.id,
    required this.title,
    this.posterPath,
    required this.voteAverage,
    required this.releaseDate,
  });

  String get fullPosterPath {
    if (posterPath != null && posterPath!.isNotEmpty) {
      return 'https://image.tmdb.org/t/p/w500$posterPath';
    }
    return '';
  }
}
