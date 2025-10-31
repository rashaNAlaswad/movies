import 'package:json_annotation/json_annotation.dart';
import 'movie_model.dart';

part 'popular_movies_response_model.g.dart';

@JsonSerializable()
class PopularMoviesResponseModel {
  final int page;
  final List<MovieModel> results;
  @JsonKey(name: 'total_pages')
  final int totalPages;
  @JsonKey(name: 'total_results')
  final int totalResults;

  PopularMoviesResponseModel({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory PopularMoviesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PopularMoviesResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$PopularMoviesResponseModelToJson(this);
}

