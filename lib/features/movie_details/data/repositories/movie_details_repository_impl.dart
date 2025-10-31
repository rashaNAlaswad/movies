import '../../../../core/networking/api_result.dart';
import '../../domain/entities/movie_details_entity.dart';
import '../../domain/repositories/movie_details_repository.dart';
import '../datasources/details_remote_data_source.dart';

class MovieDetailsRepositoryImpl implements MovieDetailsRepository {
  final DetailsRemoteDataSource _detailsRemoteDataSource;

  MovieDetailsRepositoryImpl(this._detailsRemoteDataSource);

  @override
  Future<ApiResult<MovieDetailsEntity>> getMovieDetails(int movieId) async {
    return _detailsRemoteDataSource.getMovieDetails(movieId);
  }
}
