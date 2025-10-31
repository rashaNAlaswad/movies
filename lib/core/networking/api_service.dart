import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import '../../features/home/data/models/popular_movies_response_model.dart';
import '../../features/movie_details/data/models/movie_details_model.dart';
import 'api_urls.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiUrls.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET(ApiUrls.popular)
  Future<PopularMoviesResponseModel> getPopularMovies(
    @Query('api_key') String apiKey,
    @Query('page') int page,
  );

  @GET(ApiUrls.movieDetails)
  Future<MovieDetailsModel> getMovieDetails(
    @Path('movie_id') int movieId,
    @Query('api_key') String apiKey,
  );
}
