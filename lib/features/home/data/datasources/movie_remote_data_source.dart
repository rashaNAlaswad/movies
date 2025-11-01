import '../../../../core/constants/api_constants.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';
import '../../domain/entities/popular_movies_response.dart';
import '../datasources/movie_local_data_source.dart';
import '../mappers/movie_mapper.dart';

class MovieRemoteDataSource {
  final ApiService _apiService;
  final MovieLocalDataSource _movieLocalDataSource;

  MovieRemoteDataSource(this._apiService, this._movieLocalDataSource);

  Future<ApiResult<PopularMoviesResponse>> getPopularMovies(int page) async {
    try {
      final response = await _apiService.getPopularMovies(
        ApiConstants.apiKey,
        page,
      );

      // Cache the response model
      await _movieLocalDataSource.cachePopularMovies(response, page);

      final movies = MovieMapper.toListDomain(response.results);
      final popularMoviesResponse = PopularMoviesResponse(
        movies: movies,
        totalPages: response.totalPages,
      );
      return ApiResult.success(popularMoviesResponse);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
