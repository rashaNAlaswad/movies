import '../../../../core/networking/api_result.dart';
import '../entities/movie_details_entity.dart';

abstract class MovieDetailsRepository {
  Future<ApiResult<MovieDetailsEntity>> getMovieDetails(int movieId);
}
