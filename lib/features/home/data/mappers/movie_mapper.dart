import '../../domain/entities/movie_entity.dart';
import '../models/movie_model.dart';

class MovieMapper {
  static MovieEntity toDomain(MovieModel model) {
    return MovieEntity(
      id: model.id,
      title: model.title,
      posterPath: model.posterPath,
      voteAverage: model.voteAverage,
      releaseDate: model.releaseDate,
    );
  }

  static List<MovieEntity> toListDomain(List<MovieModel> models) {
    return models.map((model) => toDomain(model)).toList();
  }
}
