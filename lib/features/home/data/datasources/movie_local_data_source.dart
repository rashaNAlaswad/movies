import '../../../../core/database/app_database.dart';
import '../../../../core/networking/api_error_model.dart';
import '../../../../core/networking/api_result.dart';
import '../../domain/entities/popular_movies_response.dart' as domain;
import '../models/movie_model.dart';
import '../models/popular_movies_response_model.dart';
import '../mappers/db_movie_mapper.dart';
import '../mappers/movie_mapper.dart';

class MovieLocalDataSource {
  final AppDatabase _database;

  MovieLocalDataSource(this._database);

  Future<ApiResult<domain.PopularMoviesResponse>> getPopularMovies(
    int page,
  ) async {
    try {
      if (!_isFirstPage(page)) {
        return ApiResult.failure(
          ApiErrorModel(message: 'Only first page is cached'),
        );
      }

      final movies = await _getCachedMovies();
      if (movies.isEmpty) {
        return ApiResult.failure(
          ApiErrorModel(message: 'No cached movies available'),
        );
      }

      final movieModels = DbMovieMapper.toModels(movies);
      final movieEntities = MovieMapper.toListDomain(movieModels);

      return ApiResult.success(
        domain.PopularMoviesResponse(movies: movieEntities, totalPages: 1),
      );
    } catch (error) {
      return ApiResult.failure(
        ApiErrorModel(message: 'Error retrieving cached data: $error'),
      );
    }
  }

  Future<void> cachePopularMovies(
    PopularMoviesResponseModel response,
    int page,
  ) async {
    try {
      if (!_isFirstPage(page)) {
        return;
      }

      await _database.transaction(() async {
        await _clearAllMovies();
        await _saveMovies(response.results);
      });
    } catch (error) {
      _handleCacheError(error);
    }
  }

  Future<List<Movy>> _getCachedMovies() async {
    return await (_database.select(_database.movies)).get();
  }

  Future<void> _clearAllMovies() async {
    await _database.delete(_database.movies).go();
  }

  Future<void> _saveMovies(List<MovieModel> movies) async {
    for (final movie in movies) {
      await _database
          .into(_database.movies)
          .insertOnConflictUpdate(DbMovieMapper.toCompanion(movie));
    }
  }

  bool _isFirstPage(int page) => page == 1;

  void _handleCacheError(dynamic error) {
    print('Error caching data: $error');
  }
}
