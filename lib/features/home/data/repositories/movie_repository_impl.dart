import '../../../../core/networking/api_result.dart';
import '../../domain/entities/popular_movies_response.dart';
import '../../domain/repositories/movie_repository.dart';
import '../datasources/movie_local_data_source.dart';
import '../datasources/movie_remote_data_source.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource _movieRemoteDataSource;
  final MovieLocalDataSource _movieLocalDataSource;

  MovieRepositoryImpl(this._movieRemoteDataSource, this._movieLocalDataSource);

  @override
  Future<ApiResult<PopularMoviesResponse>> getPopularMovies(int page) async {
    // Try API first
    final apiResult = await _movieRemoteDataSource.getPopularMovies(page);

    // If API succeeded, return the result
    final apiResponse = apiResult.whenOrNull(success: (response) => response);
    if (apiResponse != null) {
      return apiResult;
    }

    // API failed: Try to get from cache
    final cacheResult = await _movieLocalDataSource.getPopularMovies(page);
    final cachedResponse = cacheResult.whenOrNull(
      success: (response) => response,
    );

    if (cachedResponse != null) {
      final modifiedResponse = PopularMoviesResponse(
        movies: cachedResponse.movies,
        totalPages: page + 99,
      );
      return ApiResult.success(modifiedResponse);
    }

    // No cache available, return API error
    return apiResult;
  }
}
