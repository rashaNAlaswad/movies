import '../../../../core/networking/api_result.dart';
import '../entities/popular_movies_response.dart';

abstract class MovieRepository {
  Future<ApiResult<PopularMoviesResponse>> getPopularMovies(int page);
}
