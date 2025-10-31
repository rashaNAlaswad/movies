class MovieDetailsEntity {
  final int id;
  final String title;
  final String overview;
  final String? posterPath;
  final String? backdropPath;
  final double voteAverage;
  final String releaseDate;
  final int budget;
  final List<String> genres;
  final String? homepage;
  final String? imdbId;
  final int revenue;
  final int? runtime;
  final String status;
  final String? tagline;

  MovieDetailsEntity({
    required this.id,
    required this.title,
    required this.overview,
    this.posterPath,
    this.backdropPath,
    required this.voteAverage,
    required this.releaseDate,
    required this.budget,
    required this.genres,
    this.homepage,
    this.imdbId,
    required this.revenue,
    this.runtime,
    required this.status,
    this.tagline,
  });

  String get fullPosterPath {
    if (posterPath != null && posterPath!.isNotEmpty) {
      return 'https://image.tmdb.org/t/p/w500$posterPath';
    }
    return '';
  }

  String get fullBackdropPath {
    if (backdropPath != null && backdropPath!.isNotEmpty) {
      return 'https://image.tmdb.org/t/p/original$backdropPath';
    }
    return '';
  }

  String get formattedRuntime {
    if (runtime == null) return 'N/A';
    final hours = runtime! ~/ 60;
    final minutes = runtime! % 60;
    return '${hours}h ${minutes}m';
  }

  String get genresString => genres.join(', ');
}
