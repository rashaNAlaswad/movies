import '../../../../core/constants/api_constants.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';
import '../../domain/entities/movie_entity.dart';
import '../mappers/movie_mapper.dart';

class MovieRemoteDataSource {
  final ApiService _apiService;
  MovieRemoteDataSource(this._apiService);

  Future<ApiResult<List<MovieEntity>>> getPopularMovies(int page) async {
    try {
      final response = await _apiService.getPopularMovies(
        ApiConstants.apiKey,
        page,
      );
      final movies = MovieMapper.toListDomain(response.results);
      return ApiResult.success(movies);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
