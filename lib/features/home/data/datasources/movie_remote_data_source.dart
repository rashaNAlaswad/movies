import '../../../../core/constants/api_constants.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_error_model.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';
import '../../../../core/network/connectivity_service.dart';
import '../../domain/entities/popular_movies_response.dart';
import '../datasources/movie_local_data_source.dart';
import '../mappers/movie_mapper.dart';

class MovieRemoteDataSource {
  final ApiService _apiService;
  final MovieLocalDataSource _movieLocalDataSource;
  final ConnectivityService _connectivityService;

  MovieRemoteDataSource(
    this._apiService,
    this._movieLocalDataSource,
    this._connectivityService,
  );

  Future<ApiResult<PopularMoviesResponse>> getPopularMovies(int page) async {
    final isConnected = await _connectivityService.isConnected();
    if (!isConnected) {
      return ApiResult.failure(
        ApiErrorModel(message: 'No internet connection'),
      );
    }

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
