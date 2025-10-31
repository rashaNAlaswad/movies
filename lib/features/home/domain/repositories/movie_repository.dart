import '../../../../core/networking/api_result.dart';
import '../entities/movie_entity.dart';

abstract class MovieRepository {
  Future<ApiResult<List<MovieEntity>>> getPopularMovies(int page);
}
