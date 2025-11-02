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
      final movies = await _getCachedMovies(page);
      if (movies.isEmpty) {
        return ApiResult.failure(
          ApiErrorModel(message: 'No cached movies available for page $page'),
        );
      }

      final movieModels = DbMovieMapper.toModels(movies);
      final movieEntities = MovieMapper.toListDomain(movieModels);

      return ApiResult.success(
        domain.PopularMoviesResponse(movies: movieEntities, totalPages: page),
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
      await _database.transaction(() async {
        await _clearMoviesForPage(page);
        await _saveMovies(response.results, page);
      });
    } catch (error) {
      _handleCacheError(error);
    }
  }

  Future<List<Movy>> _getCachedMovies(int page) async {
    final query = _database.select(_database.movies)
      ..where((tbl) => tbl.page.equals(page));
    return await query.get();
  }

  Future<void> _clearMoviesForPage(int page) async {
    await (_database.delete(
      _database.movies,
    )..where((tbl) => tbl.page.equals(page))).go();
  }

  Future<void> _saveMovies(List<MovieModel> movies, int page) async {
    for (final movie in movies) {
      await _database
          .into(_database.movies)
          .insertOnConflictUpdate(DbMovieMapper.toCompanion(movie, page));
    }
  }

  void _handleCacheError(dynamic error) {
    print('Error caching data: $error');
  }
}
