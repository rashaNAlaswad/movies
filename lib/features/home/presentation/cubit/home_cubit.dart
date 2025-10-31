import '../../../../core/pagination/pagination_cubit.dart';
import '../../../../core/pagination/pagination_state.dart';
import '../../domain/entities/movie_entity.dart';
import '../../domain/repositories/movie_repository.dart';

class HomeCubit extends PaginationCubit<MovieEntity> {
  final MovieRepository movieRepository;

  HomeCubit(this.movieRepository);

  @override
  Future<void> fetchPage(int page) async {
    final result = await movieRepository.getPopularMovies(page);

    result.when(
      success: (response) {
        if (page == 1) {
          items = response.movies;
        } else {
          items.addAll(response.movies);
        }

        currentPage = page;
        totalPages = response.totalPages;

        emit(
          PaginationSuccess<MovieEntity>(
            items: items,
            currentPage: currentPage,
            hasMorePages: currentPage < totalPages,
          ),
        );
      },
      failure: (error) {
        emit(PaginationFailure<MovieEntity>(error));
      },
    );
  }
}
