import '../../domain/entities/movie_details_entity.dart';
import '../models/movie_details_model.dart';

class MovieDetailsMapper {
  static MovieDetailsEntity toDomain(MovieDetailsModel model) {
    return MovieDetailsEntity(
      id: model.id,
      title: model.title,
      overview: model.overview,
      posterPath: model.posterPath,
      backdropPath: model.backdropPath,
      voteAverage: model.voteAverage,
      releaseDate: model.releaseDate,
      budget: model.budget,
      genres: model.genres.map((g) => g.name).toList(),
      homepage: model.homepage,
      imdbId: model.imdbId,
      revenue: model.revenue,
      runtime: model.runtime,
      status: model.status,
      tagline: model.tagline,
    );
  }
}
