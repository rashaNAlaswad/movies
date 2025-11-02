import 'package:drift/drift.dart';
import '../../../../core/database/app_database.dart';
import '../models/movie_model.dart';

class DbMovieMapper {
  static MovieModel toModel(Movy dbMovie) {
    return MovieModel(
      id: dbMovie.id,
      title: dbMovie.title,
      overview: '',
      posterPath: dbMovie.posterPath,
      backdropPath: null,
      voteAverage: dbMovie.voteAverage,
      releaseDate: dbMovie.releaseDate,
      adult: false,
      originalLanguage: '',
      originalTitle: '',
      popularity: 0.0,
      voteCount: 0,
      video: false,
      genreIds: [],
    );
  }

  static List<MovieModel> toModels(List<Movy> dbMovies) {
    return dbMovies.map(toModel).toList();
  }

  static MoviesCompanion toCompanion(MovieModel movie, int page) {
    return MoviesCompanion(
      id: Value(movie.id),
      title: Value(movie.title),
      posterPath: Value(movie.posterPath),
      voteAverage: Value(movie.voteAverage),
      releaseDate: Value(movie.releaseDate),
      page: Value(page),
    );
  }
}
