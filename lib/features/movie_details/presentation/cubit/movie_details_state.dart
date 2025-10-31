part of 'movie_details_cubit.dart';

sealed class MovieDetailsState {}

class MovieDetailsInitial extends MovieDetailsState {}

class MovieDetailsLoading extends MovieDetailsState {}

class MovieDetailsSuccess extends MovieDetailsState {
  final MovieDetailsEntity movieDetails;

  MovieDetailsSuccess(this.movieDetails);
}

class MovieDetailsFailure extends MovieDetailsState {
  final ApiErrorModel error;

  MovieDetailsFailure(this.error);
}

