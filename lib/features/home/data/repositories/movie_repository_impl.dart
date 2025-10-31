import '../../../../core/networking/api_result.dart';
import '../../domain/entities/movie_entity.dart';
import '../../domain/repositories/movie_repository.dart';
import '../datasources/movie_remote_data_source.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource _movieRemoteDataSource;

  MovieRepositoryImpl(this._movieRemoteDataSource);

  @override
  Future<ApiResult<List<MovieEntity>>> getPopularMovies(int page) async {
    return _movieRemoteDataSource.getPopularMovies(page);
  }
}
