import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/networking/api_error_model.dart';
import '../../domain/entities/movie_details_entity.dart';
import '../../domain/repositories/movie_details_repository.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  final MovieDetailsRepository movieDetailsRepository;

  MovieDetailsCubit(this.movieDetailsRepository) : super(MovieDetailsInitial());

  Future<void> fetchMovieDetails(int movieId) async {
    emit(MovieDetailsLoading());

    final result = await movieDetailsRepository.getMovieDetails(movieId);

    result.when(
      success: (movieDetails) {
        emit(MovieDetailsSuccess(movieDetails));
      },
      failure: (error) {
        emit(MovieDetailsFailure(error));
      },
    );
  }
}
