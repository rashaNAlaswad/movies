import '../../../../core/constants/api_constants.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';
import '../../domain/entities/movie_details_entity.dart';
import '../mappers/movie_details_mapper.dart';

class DetailsRemoteDataSource {
  final ApiService _apiService;
  DetailsRemoteDataSource(this._apiService);

  Future<ApiResult<MovieDetailsEntity>> getMovieDetails(int movieId) async {
    try {
      final response = await _apiService.getMovieDetails(
        movieId,
        ApiConstants.apiKey,
      );
      final movieDetails = MovieDetailsMapper.toDomain(response);
      return ApiResult.success(movieDetails);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
