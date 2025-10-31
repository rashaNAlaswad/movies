import 'package:flutter_bloc/flutter_bloc.dart';
import 'pagination_state.dart';

abstract class PaginationCubit<T> extends Cubit<PaginationState<T>> {
  PaginationCubit() : super(const PaginationInitial());

  int currentPage = 0;
  int totalPages = 1;
  bool isLoadingMore = false;
  List<T> items = [];

  Future<void> fetchPage(int page);

  Future<void> fetchFirstPage() async {
    emit(const PaginationLoading());
    currentPage = 1;
    await fetchPage(currentPage);
  }

  Future<void> loadMore() async {
    if (isLoadingMore || currentPage >= totalPages) return;

    isLoadingMore = true;
    emit(PaginationLoadingMore<T>(items: items, currentPage: currentPage));

    final nextPage = currentPage + 1;
    await fetchPage(nextPage);

    isLoadingMore = false;
  }

  void reset() {
    currentPage = 0;
    totalPages = 1;
    isLoadingMore = false;
    items = [];
    emit(const PaginationInitial());
  }
}
